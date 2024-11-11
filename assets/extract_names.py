import os
"""
This script lists all filenames in the 'assets/icons/' directory and wright them at the end of file.
Modules:
     os: Provides a way of using operating system dependent functionality like reading or writing to the file system.
Functions:
     None
Usage:
     Run the script to print all filenames in the 'assets/icons/' directory.
"""
icons_names:list[str] = []

for filename in os.listdir('assets/icons/'):
     icons_names.append(filename)

with open(__file__, 'a') as file:
     file.write('\n"""\n')
     for name in icons_names:
          file.write(f'assets/icons/{name}\n')
     file.write('"""\n')



"""
assets/icons/01_arrow-right-01.svg
assets/icons/01_home-09.svg
assets/icons/01_view.svg
assets/icons/02_arrow-left-01.svg
assets/icons/02_dashboard-square-edit.svg
assets/icons/02_message-02.svg
assets/icons/02_view-off.svg
assets/icons/03_arrow-up-01.svg
assets/icons/03_favourite.svg
assets/icons/04_arrow-down-01.svg
assets/icons/04_lock-password.svg
assets/icons/04_user-circle.svg
assets/icons/04_user.svg
assets/icons/05_arrow-left-02.svg
assets/icons/05_mail-01.svg
assets/icons/05_security-lock.svg
assets/icons/06_cancel-01.svg
assets/icons/06_language-circle.svg
assets/icons/06_password-validation.svg
assets/icons/07_arrow-right-02.svg
assets/icons/07_paint-board.svg
assets/icons/07_user-search-01.svg
assets/icons/08_edit-02.svg
assets/icons/08_settings-02.svg
assets/icons/09_volume-mute-01.svg
assets/icons/10_notification-02.svg
assets/icons/11_logout-02.svg
assets/icons/12_globe-02.svg
assets/icons/13_delete-02.svg
assets/icons/14_plus-sign.svg
assets/icons/15_search-01.svg
assets/icons/1_filter-horizontal.svg
"""
