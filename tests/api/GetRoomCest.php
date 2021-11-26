<?php

class GetRoomCest
{
    public function _before(ApiTester $I)
    {
    }

    // tests
    public function tryToTest(ApiTester $I)
    {
        $I->sendGet('/getRoom?roomid=4');
        $I->seeResponseCodeIsSuccessful();
        $I->seeResponseIsJson();
        $I->seeResponseContains('"status":"success"');
        $I->seeResponseMatchesJsonType([
            'status' => 'string',
            'result' => 'array'
        ]);
    }
}
