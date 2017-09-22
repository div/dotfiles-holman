# The following is based on https://github.com/gma/bundler-exec

bundled_commands=(foreman rake rspec ruby puma)

## Functions

_bundler-installed() {
  which bundle > /dev/null 2>&1
}

_within-bundled-project() {
  local check_dir=$PWD
  while [ $check_dir != "/" ]; do
    [ -f "$check_dir/Gemfile" ] && return
    check_dir="$(dirname $check_dir)"
  done
  false
}

_run-with-bundler() {

  if [ $1 = "rspec" ]; then
    no_rails=false
    # echo "So, you like rspec, huh?"

    # Remove trailing line numbers from filename, e.g. spec/my_spec.rb:33
    grep_filename=`echo $2 | sed 's/:.*$//g'`

    #(grep -R 'rails_helper' $grep_filename) > /dev/null
    (find "$grep_filename" -type f -exec fgrep rails_helper {} \+) > /dev/null
    if [ $? -eq 1 ]; then # no match; we have a stand-alone spec
      # echo "Cool, we've got no rails"
      no_rails=true
    fi

    if $no_rails; then
      echo "Now we run standalone rspec for you"
      $@
    else
      echo "Running with bundle exec... gonna be slow :("
      bundle exec $@
    fi
  elif _bundler-installed && _within-bundled-project; then
    bundle exec $@
  else
    $@
  fi
}

## Main program
for cmd in $bundled_commands; do
  eval "function bundled_$cmd () { _run-with-bundler $cmd \$@}"
  alias $cmd=bundled_$cmd

  if which _$cmd > /dev/null 2>&1; then
        compdef _$cmd bundled_$cmd=$cmd
  fi
done
