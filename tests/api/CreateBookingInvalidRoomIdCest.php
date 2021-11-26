<?php

class CreateBookingInvalidRoomIdCest
{
    public function _before(ApiTester $I)
    {
    }

    // tests
    public function tryToTest(ApiTester $I)
    {
        $I->sendGet('/createbooking?roomid=99999999999999999999999999999999999999&email=test@gmail.com&startdate=2030-02-21&enddate=2030-02-23');
        $I->seeResponseCodeIsSuccessful();
        $I->seeResponseIsJson();
        $I->seeResponseContains('"status":"error"');
        $I->seeResponseMatchesJsonType([
            'status' => 'string',
            'message' => 'string'
        ]);
    }
}
