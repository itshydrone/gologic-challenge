<?php

class GetRoomsCharacterPageCest
{
    public function _before(ApiTester $I)
    {
    }

    // tests
    public function tryToTest(ApiTester $I)
    {
        $I->sendGet('/getrooms?page=a');
        $I->seeResponseCodeIsSuccessful();
        $I->seeResponseIsJson();
        $I->seeResponseContains('"status":"error"');
        $I->seeResponseMatchesJsonType([
            'status' => 'string',
            'message' => 'string'
        ]);
    }
}
