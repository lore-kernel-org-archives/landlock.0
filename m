Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2071.outbound.protection.outlook.com [40.92.98.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39127E6
	for <landlock@lists.linux.dev>; Mon, 21 Nov 2022 01:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csOwlK84t7FLwnjWx1/kEoE1z4dOv0CLt1XYWYe40JWeYlEfS7M1pPQuVVyv5UPlvUrXjY1FxyDyzNbN9zV+CV6YS4T1YB2C0jqBsi7e8z3CtGWrmOx6sHz0VAO8nt63ZW5U3D07v+VC5wDrdNN4QmHMiN/noVy4St9BPMFj93Za8eIz6WvvWDF6rofKgnMmDyGtXiyoHYkIsI23DyBfIylH2YLzVsRtrSpVj/V5GZ1rk2DYFJVxSN4nojuviYWKKZy3w9bXwT/vXuBCoiltcQ8rVM9eHjDlMU5LJyiPX6GUzRtALjMa8z3jbnaiK4lZM63OZTpwTEhlAOdoaVBweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3/K5mZylUlmZvIhcoY+XDDjgCXjHUqCFIZFVQHUQKU=;
 b=dq6qb2eQTNQHhHg72nx0b7Hlg1qlEZz5CzVapVupLeiOnMBXwsZ51RmsxBGQS/P8tavqqzuRZwZhQVHyAtnS5zokpVCtRJ5gvCN0vS3mwHIsYAoDskkx+GnvX2DmG9C5fGjoDioi490DghcJji1GOdlZT+9tKDLBTCRA6c+nD4Jzeodg/LqjRxTYkbByxJswMHaAblg+TM0apABknJFOFLdZDk5KUxIj25AjdyZkht+6wpn9f+yW8wsT71P384ClvusbI+pbZZV6G4z4IWIBz004Dr/QkVJrhTQHCD3viY6W8yQipA+DOMyj8MstCa9W2hH8q00KFdzFsDwq2zVrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3/K5mZylUlmZvIhcoY+XDDjgCXjHUqCFIZFVQHUQKU=;
 b=X+UVq12udjFwr2piFkKfxSK+Ts8clTBiXiRNGrAQS7mD/BAxhuA/0uSR0kK9emSMaEeUmpjRAAsOIm4U1MkG3ZQxiNakFuMw4AH5VU4bhYR79KJj37eSzEBznDJjqh6X6GmFiX0L6YYQQliJmxWxcwOhJyfWpmODqsNTDyxcJmNzWGf/8WlQC5X+PxAjBPoUK0eylhOF8/Zr0DstpFPzk86ujMCbLsFkcQNTQcSr/zxXNhtFazyMWkCYd9PT1S0OWDoXBR+xELGeKy+ai5SHilV5FeE4lWS+Qz4adaFA/H/fwFhe0MUfzdd5DTdJ+rL8y7lxPsdpqwY3yiJOD3vAfw==
Received: from OSZP286MB1725.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1b9::12)
 by OSZP286MB2379.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:15e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 01:41:56 +0000
Received: from OSZP286MB1725.JPNP286.PROD.OUTLOOK.COM
 ([fe80::eefb:61f0:c4d2:56ca]) by OSZP286MB1725.JPNP286.PROD.OUTLOOK.COM
 ([fe80::eefb:61f0:c4d2:56ca%3]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 01:41:56 +0000
From: Anquan Wu <leiqi96@hotmail.com>
To: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject:
 =?gb2312?B?u9i4tDogSFRNTCBtZXNzYWdlIHJlamVjdGVkOiBxdWVzdGlvbnMgYWJvdXQg?=
 =?gb2312?Q?ruleset_and_rule?=
Thread-Topic: HTML message rejected: questions about ruleset and rule
Thread-Index: AQHY/UmkZcX0K2l5X0q9siucR9qXCK5Imckt
Date: Mon, 21 Nov 2022 01:41:56 +0000
Message-ID:
 <OSZP286MB1725ADB18DFFD0BDB5A0BF99B80A9@OSZP286MB1725.JPNP286.PROD.OUTLOOK.COM>
References: <1668994568-13324-mlmmj-373676f9@lists.linux.dev>
In-Reply-To: <1668994568-13324-mlmmj-373676f9@lists.linux.dev>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-tmn: [ZQbRA2ghh+eqVcs+iE3QE63m/SHvdBAa]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZP286MB1725:EE_|OSZP286MB2379:EE_
x-ms-office365-filtering-correlation-id: ed760609-cd7b-470e-7a74-08dacb619328
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9BU9ur8NCDSTNZJYRAWz3M418tXyfEwNKSz09YSPGzYsshdi0bEzEHlg+obzF40AKcc66J0Z3V28E8g2gH2zgpPRo4+4H/KtpX2GYqtqHkh6y++HHUgv906/ftlPbbyhprd566c9oEuucWNx1PQm2OqyJnLjOdsb1E/zljE1+7VOWtNHd2NdVC9PBxPuMBxEjHY4fGmPBTo6xrYvj3BGsmqxIU1JqTcrXHvFdsKU20K5OiJvwMWp8T0H9xOHJo4AuAazAMTzPKgroj2997JbIEoEuzKs1IoUXW+UErV5CUF7zO6WLuMawDergDV/9RfiwE6doNCeakX7bPAh4E2kmPf5jWWaTmDU1cTOtBq1kL0U6SNIG0zcM9vjwNtWEHc3HGDhV6jFNVRCbw4+AnWPw9IZdc5OoJYp7/mS/AbmN15ciUxMgTbIlZm7WEokE7KwMfrB7iiTx9XUWNckg4xZpx32cihqgg7kDHKBizu+6Fxy1F5PdS9ZQ7oeP6GS2KZTkMBqo4jSKhVlww9ENe+aNzW2vqkCl5j8oYMisbwLt7+E+Q0FsYmGkq6WRuQ9DWuhuFqtZyN7rzB0X0CQl9uSX8xjI1uB+/vJ/6dB8mNQ/zU=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QUpCK3JEU1lwcHBrYVUxamgvWVFod1RyN3FKdXhZcTJTRExYdllZUFgvaHlP?=
 =?gb2312?B?dHUycW43Y1kzVVRkR25RR0lWaGprMk16QWsyZStFVjFQWHZHS2FXNDVzU3p2?=
 =?gb2312?B?a3VNSTFabVVXR3Zaazdlb1BUMko1S3d4TVhDOUY5aEU3RzBjdUdPcVJkKy9N?=
 =?gb2312?B?YkQwVzlmQmMwNDVaTjMzMWRJV2luSnd1bjlYdGJCL0FqNlpzMFlDc2p6L2dl?=
 =?gb2312?B?K0x6SmRycVdhbnVXNytiRi8yU0tzUHRiZGdaK0tPd05VMXU4eFBsOFZvUkxI?=
 =?gb2312?B?RkpGZk5RVVF2VHorNnpRY2NRTWtLRGt4QVBKWUJWZktZN1ZhUXVDQzZFYlJ6?=
 =?gb2312?B?ZDhLOEN2Q3N3VE1jd1lzaFh1dko3bnlPbW1PYkoydzBGVm9BQWxrUStZK3dt?=
 =?gb2312?B?K1I5VXArZ0pML09rMmJqKzMrcGhtWXZvV2owY2x0ZjgvZWs1VUZjTEgwb2to?=
 =?gb2312?B?c2RyRjB0NldRK21WVWJkZGJhZGxFZ1ZGT21HMjhLd2RHZlBaNS9aTWxtTTEz?=
 =?gb2312?B?K1E1UGYwZmxjNDd5ZU1YVjRzSE5QcWpwL2xVR25MQllQVUtFSDBuNklObUhB?=
 =?gb2312?B?U2o2YkJ5TG5iMHRZMFd6UnkyRmZHRlpSTThvRG56Z0pFQVJyblRSUTlVWXBJ?=
 =?gb2312?B?WDg0bnJ4OEgxU1NmU3hHaDBVZkR5ZDM0aWFaZkc3eW1hRUF6bFJjdm1JY3Zt?=
 =?gb2312?B?alZDTEVyTGF5RjBYSmJ2NGFyVnM3L0JLWHFVU3d2aTBOd2VoYUZuZndyMHln?=
 =?gb2312?B?TXp2aytnVmNCZ3BiU2l0bFRBaWNHdFJWd1FRa2ppR3lpZnpGN2trUmNjb2dM?=
 =?gb2312?B?N2tXbUIrRytKZFZMRldETnZsdnlHVis0TXYxR0FlMm1BeWJBVjg2VWlhRll6?=
 =?gb2312?B?OEVpYTdGWUJkTDJCQXg2bmJWaGdWaG5ZK2p0ekxZWDdoaW9XUUQrMEsyYk4w?=
 =?gb2312?B?V1BYWGdjcWdua21sc0VGVHBpY3pxZVVMaUhEQUJ4YkE1R3VKK2RGbXF2WU0z?=
 =?gb2312?B?eTlkc3VMUXMzbU5QOVp3cWJwTVFoTmJCMmJnZnl5M1YrSkkyMFhVcTUyeEs2?=
 =?gb2312?B?VENZazRHOThFRHNQNHZXMXNleWpNWjZqdDFneW1wK1U4VkltejVvMCtkSWw1?=
 =?gb2312?B?L29mMnNzN2F2RGpQbzl3VDYyWjJaUDZzb2gzbXBIWVh4TzV6RnNVMFEyZnB5?=
 =?gb2312?B?OVJ6SUpjd2ZXa3JQY0w4Y0IycUNDdXpvVUdsc3JQSUpvVU9sNjIwV3RPTkxx?=
 =?gb2312?B?dkhkdGdLMWFncEp1QzRFNk5GVWNmcWp2QVFsVlNYMnJvcjk3ZXNJNTlkeGgz?=
 =?gb2312?B?Y1FiZ3FzbExNRzhva0dNajRzd2ZmNmNrbjROUmRwejV5Q0xoa0NPVW5HV2Vt?=
 =?gb2312?B?dDBicU1JdXE4aDhmbUFNQVFBbHNmM3pzTDZDVXR3NElvMVhFZWtPVGM3Szhl?=
 =?gb2312?B?L0FHYmtZNlNPUFlybmxBMGF4dkZEaGdpRUFZUit2ZE5jOEp2dnpRT2ZnZjF5?=
 =?gb2312?B?anN4OHNqUzhmbFp6UGxWYmJSYzI5TnNRMWFsT1daVWhoTmZzSHZLSzVTdDg2?=
 =?gb2312?B?UTd1ekZ1a0NPdDQxZEhoaVpubEIrcGVEY1ZIbURVTFhMeFpWOXZDWXAvQisy?=
 =?gb2312?B?MzB2eVlFblMwYzNSNUZEWmJBLzhGdGxoMzFqcWs1RGVwelZHUlBnZUgvQ3Bt?=
 =?gb2312?Q?1io+QzQ9vDxyCeHPZt+k?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB1725.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ed760609-cd7b-470e-7a74-08dacb619328
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 01:41:56.7203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2379

bGFuZGxvY2sgc3Vic2NyaWJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCreivP7IyzogbGFuZGxvY2srb3duZXJAbGlzdHMubGludXguZGV2IDxsYW5kbG9jaytv
d25lckBsaXN0cy5saW51eC5kZXY+DQq3osvNyrG85DogMjAyMsTqMTHUwjIxyNUgMTozNg0KytW8
/sjLOiBsZWlxaTk2QGhvdG1haWwuY29tDQrW98ziOiBIVE1MIG1lc3NhZ2UgcmVqZWN0ZWQ6IHF1
ZXN0aW9ucyBhYm91dCBydWxlc2V0IGFuZCBydWxlDQoNCkdyZWV0aW5ncyENCg0KVGhpcyBpcyB0
aGUgbWxtbWogcHJvZ3JhbSBtYW5hZ2luZyB0aGUgPGxhbmRsb2NrQGxpc3RzLmxpbnV4LmRldj4g
bWFpbGluZw0KbGlzdC4NCg0KWW91ciBtZXNzYWdlIHRvIDxsYW5kbG9ja0BsaXN0cy5saW51eC5k
ZXY+IHdhcyBub3QgZGVsaXZlcmVkIHRvIHRoZSBsaXN0DQpiZWNhdXNlIGl0IGNvbnRhaW5lZCBh
IEhUTUwgcGFydC4gT25seSB0ZXh0L3BsYWluIG1lc3NhZ2VzIGFyZSBhbGxvd2VkIG9uDQp0aGlz
IGxpc3QuDQoNClBsZWFzZSBjb25maWd1cmUgeW91ciBtYWlsIGNsaWVudCB0byBvbmx5IHNlbmQg
cGxhaW4gdGV4dCBtYWlsLg0KDQpGb3IgeW91ciByZWZlcmVuY2UsIHRoZSByZWplY3RlZCBtZXNz
YWdlIGZvbGxvd3MgYmVsb3cuDQo=
