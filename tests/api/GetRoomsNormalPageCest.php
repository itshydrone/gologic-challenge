<?php

class GetRoomsNormalPageCest
{
    public function _before(ApiTester $I)
    {
    }

    // tests
    public function tryToTest(ApiTester $I)
    {
        $I->sendGet('/getRooms?page=3');
        $I->seeResponseCodeIsSuccessful();
        $I->seeResponseIsJson();
        $I->seeResponseContains('"status":"success"');
        $I->seeResponseMatchesJsonType([
            'status' => 'string',
            'result' => 'array',
            'hasNextPage' => 'boolean'
        ]);
    }
}
