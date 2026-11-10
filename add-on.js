# Get your access token from https://supabase.com/dashboard/account/tokens
export SUPABASE_ACCESS_TOKEN="your-access-token"
export PROJECT_REF="your-project-ref"

# Get current IPv4 add-on status
curl -X GET "https://api.supabase.com/v1/projects/$PROJECT_REF/billing/addons" \
  -H "Authorization: Bearer $SUPABASE_ACCESS_TOKEN"

# Enable IPv4 add-on
curl -X PATCH "https://api.supabase.com/v1/projects/$PROJECT_REF/billing/addons" \
  -H "Authorization: Bearer $SUPABASE_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "addon_variant": "ipv4_default",
    "addon_type": "ipv4"
  }'

# Disable IPv4 add-on
curl -X DELETE "https://api.supabase.com/v1/projects/$PROJECT_REF/billing/addons/ipv4_default" \
  -H "Authorization: Bearer $SUPABASE_ACCESS_TOKEN"