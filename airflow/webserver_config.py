import os

from flask_appbuilder.security.manager import AUTH_LDAP

basedir = os.path.abspath(os.path.dirname(__file__))

# Flask-WTF flag for CSRF
WTF_CSRF_ENABLED = True

AUTH_TYPE = AUTH_LDAP 
AUTH_LDAP_SERVER = os.environ["AUTH_LDAP_SERVER"]
AUTH_LDAP_USE_TLS = False

# registration configs
AUTH_USER_REGISTRATION = True
AUTH_USER_REGISTRATION_ROLE = "Public"  # Users will be given this role on registration

AUTH_LDAP_FIRSTNAME_FIELD = os.environ["AUTH_LDAP_FIRSTNAME_FIELD"]
AUTH_LDAP_LASTNAME_FIELD = os.environ["AUTH_LDAP_LASTNAME_FIELD"]
AUTH_LDAP_EMAIL_FIELD = os.environ["AUTH_LDAP_EMAIL_FIELD"]
AUTH_LDAP_USERNAME_FORMAT = os.environ["AUTH_LDAP_USERNAME_FORMAT"]
AUTH_LDAP_SEARCH = os.environ["AUTH_LDAP_SEARCH"]
AUTH_LDAP_UID_FIELD = os.environ["AUTH_LDAP_UID_FIELD"]
