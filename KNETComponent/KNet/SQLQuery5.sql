USE [MicroclearLight_june2018]
GO

DECLARE	@return_value int

EXEC	@return_value = [MicroclearLight_june2018]..[dbo].[GetOnlinePaymentDetailsGCSReceiptsKnet] 5841013709056633892 

SELECT	'Return Value' = @return_value

GO


sp_helptext [GetOnlinePaymentDetailsGCSReceiptsKnet]
sp_helptext UpdatePaymentDetailsGCSReceiptsKnet
select *  FROM OnlinePaymentTokensGCSReceiptsKnet  

update OnlinePaymentTokensGCSReceiptsKnet Set expirytime=getdate()+100 where Tokenid=5841013709056633892
2018-06-18 13:07:17.973

select top(1) * from OnlinePaymentTokensGCSReceiptsKnet where TokenId=5841013709056633892

select * from OnlinePaymentDetailsGCSReceiptsKnet where Tokenid=4456503841892254819

update OnlinePaymentDetailsGCSReceiptsKnet set StateId='' where Tokenid=4456503841892254819
rgrgvrgvrgv
select * from ActivityLogger order by ID desc
<?xml version="1.0" encoding="utf-16"?>  <PayReq xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">    <GCSPayReq>      <ReferenceType>M</ReferenceType>      <Amount>67.710</Amount>      <OLPaymentId />      <PortalLoginId>csa.swk</PortalLoginId>      <LogInPortId>712360</LogInPortId>      <OrganizationId>29593</OrganizationId>      <PaymentFor>3</PaymentFor>      <PaidByType>B</PaidByType>      <lang>eng</lang>      <ReceiptId>13054120</ReceiptId>      <KNETAccType>332294075</KNETAccType>      <BrPaymentTransactionId>1162</BrPaymentTransactionId>      <PostDate />      <OLTransId />      <UserId />      <ReceiptNumber>TIRC/323/eSWK18</ReceiptNumber>      <PaidByName>Csa SWK</PaidByName>      <PayeeMailId>eabouseif@agility.com</PayeeMailId>      <TrackId>3118165</TrackId>      <TranStopDateTime />    </GCSPayReq>    <KNETPayReq>      <ErrorMsg>Connection Failed with error 12175</ErrorMsg>      <Result />      <Auth />      <ResponseUrl>https://paymentstest.gcskw.com/NewResponse.aspx</ResponseUrl>      <Avr />      <Date />      <Ref />      <TransId />      <TrackId>3118165</TrackId>      <KAction>1</KAction>      <Amt>67.710</Amt>      <Udf1>67.710</Udf1>      <Udf2>TIRC.323.eSWK18</Udf2>      <Udf3>4696671005171087791</Udf3>      <Udf4>3</Udf4>      <Udf5 />      <PaymentPage />      <PaymentId />      <RawResponse />      <Currency>414</Currency>      <ErrorUrl>https://paymentstest.gcskw.com/internalError.aspx</ErrorUrl>      <Language>USA</Language>      <Timeout />      <Alias>gcs</Alias>      <ResourcePath>C:\GCSKnetDLL\GCSResource\</ResourcePath>    </KNETPayReq>  </PayReq>

<?xml version="1.0" encoding="utf-16"?>  <InternalError xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">    <KNETPayID>6833901081181960</KNETPayID>    <ErrorCode>CM00003</ErrorCode>    <postdate>7/15/2018 11:03:16 AM</postdate>  </InternalError>

SELECT top 1 1
			FROM OnlinePaymentTokensGCSReceiptsKnet OPT
			INNER JOIN OnlinePaymentDetailsGCSReceiptsKnet OPD ON OPD.OPDetailId = OPT.OPDetailId
				AND OPD.StateId = 'Started'
			WHERE --QueryString LIKE '%~ReferenceNumber='+@ReferenceNo+'~%'
				OPD.ReferenceNumber = 'GR/169/SWK18'
				AND OPD.ReceiptId = 13053746
				--@ReferenceNo='MRN/588/SWK18',@ReceiptId=13054096,
				AND getdate() < OPT.ExpiryTime
			ORDER BY OPT.datecreated DESC
			@ReferenceNo='GR/169/SWK18',@ReceiptId=13053746