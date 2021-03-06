module Intrigue
module Ident
module Check
class Auth0 < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["IAM"],
        :vendor => "Auth0",
        :product => "Auth0",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => /window.auth0AnalyticsOptions/i,
        :match_details => "Auth0 analytics",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["IAM"],
        :vendor => "Auth0",
        :product => "Auth0",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => /\/auth0/i,
        :match_details => "Auth0 link",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
