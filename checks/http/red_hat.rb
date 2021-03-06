module Intrigue
module Ident
module Check
    class RedHat < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          #
          { # server: Apache/2.4.6 (Red Hat Enterprise Linux) OpenSSL/1.0.2k-fips PHP/7.2.12
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["OS"],
            :vendor =>"Red Hat",
            :product =>"Enterprise Linux",
            :match_details =>"nginx test page",
            :match_type => :content_headers,
            :match_content =>  /^Apache.* \(Red Hat Enterprise Linux\).*$/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["OS"],
            :vendor =>"Red Hat",
            :product =>"Fedora Linux",
            :match_details =>"nginx test page",
            :match_type => :content_title,
            :match_content =>  /^Test Page for the Nginx HTTP Server on Fedora$/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Development", "Administrative", "Hypervisor"],
            :vendor =>"Red Hat",
            :product =>"OpenShift Container Platform",
            :match_details =>"error message in html",
            :references => ["https://bugzilla.redhat.com/show_bug.cgi?id=1414657"],
            :match_type => :content_body,
            :match_content =>  /Route and path matches, but all pods are down./i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Development", "Administrative", "Hypervisor"],
            :vendor =>"Red Hat",
            :product =>"OpenShift Container Platform",
            :match_details =>"title",
            :references => [""],
            :match_type => :content_title,
            :match_content =>  /Login - OpenShift Origin/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
