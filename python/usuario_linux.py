# import subprocess

# print('O clima python')

# VAR = subprocess.run(["whoami"])

# print(VAR)

# process = subprocess.Popen(['whoami'], stdout=subprocess.PIPE)
# stdout = process.communicate()[0]
# print(f'STDOUT:{stdout}')

from subprocess import check_output
out = check_output(['whoami'])

print(out.split('g'))


