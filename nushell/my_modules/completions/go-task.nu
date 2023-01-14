# tasklist from Taskfiles.y(a)ml
def "nu-complete go-tasks" [] {
  if ("Taskfile.yml" | path exists) {
    open Taskfiles.yml
  } else if ("Taskfile.yaml" | path exists) {
    open Taskfile.yaml
  } | get tasks | transpose key value | get key | each { |line| $line | str trim }
}

# go-task/task completion
export extern "task" [
  task?: string@"nu-complete go-tasks"  # name of the task defined by Taskfile.yaml
  --color(-c)                           # colored output. Enabled by default. Set flag to false or use NO_COLOR=1 to disable (default true)
  --concurrency(-C):int                 # limit number tasks to run concurrently
  --dir(-d):string                      # sets directory of execution
  --dry(-n)                             # compiles and prints tasks in the order that they would be run, without executing them
  --exit-code(-x)                       # pass-through the exit code of the task command
  --force(-f)                           # forces execution even when the task is up-to-date
  --help(-h)                            # shows Task usage
  --init(-i)                            # creates a new Taskfile.yaml in the current folder
  --interval(-I):string                 # interval to watch for changes (default "5s")
  --list(-l)                            # lists tasks with description of current Taskfile
  --list-all(-a)                        # lists tasks with or without a description
  --output(-o):string                   # sets output style: [interleaved|group|prefixed]
  --output-group-begin:string           # message template to print before a task's grouped output
  --output-group-end:string             # message template to print after a task's grouped output
  --parallel(-p)                        # executes tasks provided on command line in parallel
  --silent(-s)                          # disables echoing
  --status                              # exits with non-zero exit code if any of the given tasks is not up-to-date
  --summary                             # show summary about a task
  --taskfile(-t):string                 # choose which Taskfile to run. Defaults to "Taskfile.yml"
  --verbose(-v)                         # enables verbose mode
  --version                             # show Task version
  --watch(-w)                           # enables watch of the given task
]
