
from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin_login', admin_login, name='admin_login'),
    path('admin-dashboard', admin_dashboard, name='admin_dash'),
    path('admin-create-account', create_account, name='admin_create'),
    path('admin-manage-accounts', manage_acconts, name='admin_mana_accou'),
    path('admin-manage-users', manage_users, name='admin_mana_users'),
    path('admin-view-users', view_users, name='admin_view_users'),
    path('admin-view-frauds', view_frauds, name='admin_view_frauds'),
    path('delete_account/<int:id>', delete_account, name='delete_account'),
    path('reject_btn/<int:id>', reject_btn, name='reject_btn'),
    path('accept_btn/<int:id>', accept_btn, name='accept_btn'),
    path('delete_user/<int:id>', delete_user, name='delete_user'),
    path('change_status_btn/<int:id>', change_status_btn, name='change_status_btn'),
    path('unblock_account/<int:user_id>/', unblock_account, name='unblock_account'),
    
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)