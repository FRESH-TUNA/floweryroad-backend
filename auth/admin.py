from django.contrib import admin
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from .forms import UserChangeForm, UserCreationForm
from .models import User


class UserAdmin(BaseUserAdmin):
    form = UserChangeForm
    add_form = UserCreationForm

    #회원정보화면에서 보여주어야하는것 
    list_display = ('email', 'is_admin')           #list화면에서 보여질것  
    list_filter = ('is_admin',)                                     #list화면에서 admin 여부
    
    #edit 화면에서 보여질것
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('nickname','purpose', 'color')}),
        ('Permissions', {'fields': ('is_admin',)}),
    )

    #회원가입시 입력헤야할것 
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2')}         #admin에서 가입시 필요한것에 대해 기술한다.
        ),
    )

    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()


admin.site.register(User, UserAdmin)
admin.site.unregister(Group)