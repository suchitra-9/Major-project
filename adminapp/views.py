from django.shortcuts import render, redirect

from userapp.models import *
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# Create your views here.


def admin_login(request):
    mail = 'admin@gmail.com'
    pwd = 'admin'
    if request.method == 'POST':
        email = request.POST.get('mail')
        pwdd = request.POST.get('pwd')
        if mail == email and pwdd == pwd:
            return redirect('admin_dash')
    return render(request, 'usertemplate/main-admin-login.html')

def create_account(request):
    if request.method == 'POST':
        fname = request.POST.get('fname')
        email = request.POST.get('email')
        contact = request.POST.get('contact')
        address = request.POST.get('address')
        account_type = request.POST.get('account_type')
        amount = request.POST.get('amount')
        accnum = request.POST.get('acc_num')
        file = request.FILES['file']
        try:
            UserDetails.objects.get(Email = email)
            messages.info(request, 'user email already exists')
        except:
            UserDetails.objects.create(Account_Number=accnum, FullName = fname, Email = email, Contact =contact, Address=address, Account_Type=account_type, Partial_Amount = amount, Sign_Image = file)
            messages.success(request, 'Accont created successfully..!')
    return render(request, 'admintemplate/admin-create-account.html')



def admin_dashboard(request):

    total_users = UserDetails.objects.count()

    total_cheque_entries = ChequeDetails.objects.count()

    

    context = {
        'total_users': total_users,
        'total_cheque_entries': total_cheque_entries,
    }

    return render(request, 'admintemplate/admin-dashboard.html', context)


def manage_acconts(request):
    users = UserDetails.objects.all()
    return render(request, 'admintemplate/admin-manage-accounts.html', {'u':users})

def delete_account(request, id):
    UserDetails.objects.get(U_id = id).delete()
    messages.info(request, 'accont deleted successfully..!')
    return redirect('admin_mana_accou')

def manage_users(request):
    users = UserDetails.objects.filter(UStatus__in=['rejected', 'accepted'])
    return render(request, 'admintemplate/admin-manage-users.html', {'u':users})

def change_status_btn(req,id):
    a = UserDetails.objects.get(U_id = id)
    if a.UStatus == 'rejected':
        a.UStatus = 'accepted'
        a.save()
        print('acc')
        messages.success(req, 'user status changed to accepted')
    else:
        a.UStatus = 'rejected'
        a.save()
        print('rej')
        messages.info(req, 'user status changed to rejected')
    return redirect('admin_mana_users')

def delete_user(req, id):
    a = UserDetails.objects.get(U_id = id).delete()
    messages.info(req, 'user deleted')
    return redirect('admin_mana_users')

def view_frauds(request):
    f = ChequeDetails.objects.all()

    items_per_page = 5
    paginator = Paginator(f, items_per_page)

    page = request.GET.get('page')
    try:
        f = paginator.page(page)
    except PageNotAnInteger:
        f = paginator.page(1)
    except EmptyPage:
        f = paginator.page(paginator.num_pages)

    return render(request, 'admintemplate/admin-view-frauds.html', {'f': f})

def accept_btn(req, id):
    a = UserDetails.objects.get(U_id = id)
    a.UStatus = 'accepted'
    a.save()
    messages.success(req, 'user status changed to accepted')
    return redirect('admin_view_users')

def reject_btn(req, id):
    a = UserDetails.objects.get(U_id = id)
    a.UStatus = 'rejected'
    a.save()
    messages.info(req, 'user status changed to rejected')
    return redirect('admin_view_users')

def view_users(request):
    users = UserDetails.objects.filter(UStatus = 'pending')
    return render(request, 'admintemplate/admin-view-user-details.html', {'u':users})

from django.shortcuts import get_object_or_404, redirect

def unblock_account(request, user_id):
    user = get_object_or_404(UserDetails, U_id=user_id)
    user.Tries = 0
    user.save()
    return redirect('admin_mana_accou')