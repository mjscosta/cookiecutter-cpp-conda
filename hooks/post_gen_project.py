"""Post-project generation hooks"""

if __name__ == '__main__':
    """Initialize a git repository based on the configured branch and repo"""
<<<<<<< HEAD
    url    = 'git@{{ cookiecutter.git_server }}:{{ cookiecutter.username }}/{{ cookiecutter.repo_name }}'
=======
    url    = 'git@github.com:{{ cookiecutter.username }}/{{ cookiecutter.repo_name }}'
>>>>>>> 6a215f53f9bdc302bea269e7f1eeffc9cc02ce91
    branch = '{{ cookiecutter.branch }}'
    remote = '{{ cookiecutter.remote }}'

    import subprocess
    subprocess.call(('git', 'init'))
    subprocess.call(('git', 'checkout', '-b', branch))
    subprocess.call(('git', 'remote', 'add', remote, url))
    subprocess.call(('mv', 'pre-commit', '.git/hooks/'))
