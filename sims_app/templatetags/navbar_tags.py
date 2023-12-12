from django import template

register = template.Library()

@register.simple_tag
def is_active(request, view_name):
    """
    Custom template tag to determine if the current page matches the given view name.
    """
    return 'active' if request.resolver_match.url_name == view_name else ''
