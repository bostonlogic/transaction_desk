module TransactionDesk

  GLOBAL_TRANSACTION_TYPES = {
    'residential_listing' => '4DFF7A8E-6F64-4488-A13D-27199D21E9E3',
    'residential_sale'    => '5698FAC5-5F95-47CB-B231-13507AD61855',
    'residential_lease'   => '23971525-9316-4462-A80C-CCACEB3BCA8D',
    'commercial_listing'  => '775835F7-400E-4C1C-840E-060B25A3F972',
    'commercial_sale'     => '79979353-2687-4B60-BDB4-A5E4481C9194',
    'commercial_lease'    => '0E31E091-C168-49B5-9AD7-4CCC7E2B793E',
    'condo_listing'       => '9AE163D5-617A-4B59-9C16-E1483AA7E18C',
    'condo_sale'          => '52360063-EE4D-431D-91A0-FC178C1662C9',
    'condo_lease'         => '2A72AD5F-43E8-403D-B677-12388E3B19F8',
    'none'                => '2D9D021D-BEB7-456D-9CAE-6CE5486AC3F5'
  }

  GLOBAL_TRANSACTION_STATUSES = {
    'active'               => 'EE349FD8-5842-420F-84A2-9B80B8D9632E',
    'closed'               => '556EF1EC-9BA8-456D-B98F-C5F936286358',
    'closed_file_complete' => '6E756156-03E7-4949-B6DC-D9DCA2E9E890',
    'expired'              => 'A0F01159-940F-4138-9A38-62D179B49EC0',
    'open'                 => '6D6D2BFE-B166-4F2C-9027-629F09A35B79',
    'pending'              => 'ACFFD1D6-8734-47DA-BB9D-33AAE540C95D',
    'withdrawn'            => '9DED2F36-291D-4101-BEFB-4C7C8AADC38F'
  }

  GLOBAL_TRANSACTION_CONTACT_TYPES = {
    'appraisal_company'     => '8AEF6FD5-1BA2-4604-BD5F-624F6A04684E',
    'buyer'                 => '0ED89951-0FC9-46A9-9FC8-1ED2A85966B5',
    'buyer_lawyer'          => '88ADAAD0-6D5C-44FA-8183-E279FB4139AB',
    'condo_association_hoa' => 'C28F148A-4FBF-401D-9D07-419B7B319EBC',
    'escrow_company'        => '4641EB7B-0168-4A4A-B093-A5AB79DFBA59',
    'general'               => '0E60002E-8DF2-4724-A825-DE47DD4F8651',
    'landlord'              => '9F0CA816-385B-41D4-B655-8CE73C97B961',
    'listing_agent'         => '9679CBA8-5165-4AF5-957A-D9AA45CA444B',
    'listing_broker'        => '81731BB3-295A-4EF1-97E6-F1246ADCAB61',
    'mortgage_appraiser'    => 'C40A20C4-6EBB-4F0E-8022-F4BFAA2F5D8F',
    'mortgage_company'      => '4FD39D56-E831-4017-90EA-F13EBF6A9CF5',
    'seller'                => '918753CD-DF9D-4A8C-B9C5-2D0115835EA0',
    'seller_lawyer'         => 'D17376BA-8BB9-449C-8D9B-B66168B692F3',
    'selling_agent'         => 'D5F5B02C-7140-40F8-9AE0-E3A55210FD5F',
    'selling_broker'        => '5CEF2F80-0829-4854-873D-03E185B7E6C1',
    'tenant'                => '18360E27-FD72-4246-A784-A289A4C58F5E',
    'title_company'         => '9BCCDDB3-F5C7-4A5C-AC6A-A7277AF79111'
  }

  GLOBAL_DOCUMENT_FILE_TYPES = {
    'pdf'  => '6DB4D39B-D96D-4CFD-B97E-0C9CD1A176F9',
    'bmp'  => '19B8A033-BFC6-448D-81F7-51AF96A9E3EB',
    'xlsx' => '2FB1DDBD-B526-4235-83D1-DD3E101B0CDD',
    'xls'  => '6B660AF2-8CDD-4576-9F16-F765787A25BB',
    'gif'  => '933088C0-91FB-4EAA-BD57-A94EF1B3300F',
    'jpg'  => '2B6D6E3E-9533-4D23-9F6C-8019169177DC',
    'png'  => 'ED2807D6-5870-4858-B4AF-65722EE7BAAE',
    'tif'  => 'DDF3925F-91DA-4D93-A9E5-C42519714F5A',
    'docx' => '04AC75AA-FD9F-4011-B3F8-37B755073CED',
    'doc'  => 'A9D1F225-C406-4FE0-976D-7CAF000D573B'
  }

end
