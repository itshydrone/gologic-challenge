<?php

class GetRoomsCest
{
    public function _before(ApiTester $I)
    {
    }

    // tests
    public function tryToTest(ApiTester $I)
    {
        $I->sendGet('/getRooms');
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
