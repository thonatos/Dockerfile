shared_examples 'collection::apache' do
    include_examples 'apache::layout'

    # services
    include_examples 'apache::listening::public'

    # test after services are up
    include_examples 'apache::modules'
    include_examples 'apache::service::running'

    wait_retry 30 do
        include_examples 'web::test::pi'
    end
end

