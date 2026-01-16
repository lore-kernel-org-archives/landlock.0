Received: from MM0P280CU009.outbound.protection.outlook.com (mail-swedensouthazolkn19011038.outbound.protection.outlook.com [52.103.34.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EBD18DB2A
	for <landlock@lists.linux.dev>; Fri, 16 Jan 2026 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.34.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768601793; cv=fail; b=NgyOlaEWnsneLx7p0zk19dQVEJUXapr/3Y3WEy6HhtJa9Sh87GBs9DfIcoQuHWpRsHjHAmTSnsOXlWQ5c8yurxeygyd5oo1WD0WaAI6NvyO5KT2TX0ppgysvzaPAp9UEs85qDUFR3lCEwwzNOoA1l4+xlfcDYlleevZdClnEKo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768601793; c=relaxed/simple;
	bh=YNsy8LBH+YBXnF1rrPk4ho5yWJ8nsQhQNp+aHGSq9J8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YbsHgB3cfugBg40PDsOWwJFPfPcrS6huqnB809vIFozJaiBK2PaKA1AN5c0Uub0DFHk1yWEL2/Z9RIBuewKNvV9ayhmozF1npAvQJ0LRD0l9BWfTsuaZSdI+mrSKh7z84ck76rnAcqF+l+raYY2Xd/Pk76WKjDVl80sFM+UHpVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uO5xGG7t; arc=fail smtp.client-ip=52.103.34.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uO5xGG7t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqzKWaEStUXvn+6fPm4ClsTrwom5UVTA5ZuFJwsD8lMuJ7jNcbjbXyyFfyrsfGPygc6Xayc1WWYJ8PowUZLo04RmfXj7kXA3yAJVPFa3SmWNeg878+OPvR7qF0mPgZb4s1YgjBjuQzLps64O3yWppPnduTSDAvkIQPKFaP4wAFByfR+Dhfd8+VkqcdvM7JLXCH6ULZEHDtxGi+4oOxYfUJHSwres/FOMvATtvgN/eW6P1vtEHw1fuznmn9EKKW3f42sdosdOkCqSt+Q2HpE2qdUekBfC+ob7Q1LY47iBJFZN6CEPbUz3b5zbzKbQbVvyVZa2/b9IgmQXnx6GpxWfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N04Rjsmixb3q6DgH7YNo/nmT09PS4N72kzoT0QMEyYY=;
 b=R+W0jsK4FGMnQxBg/JbnIjJ+ZxzVvWzcB1r5EH7fcRqbNHnIBegn2g6ip/1MhbhuKW7KbkwQpfysL+yt9Eih3y76hG3W1+RC9f8Cyu7g+HoyYK2y+rubczttz9c9DvZLWJiUjtKA7a15481//Swn+xUluxaPTuQhaIw7e1Vs30D6FwSgU8lf62rYpJr/R6/2HPieX96CP6dOyUMrKbS+EDXlddRVzIZkIvojAN4CdQWYgjKxO7Nr58WdrHFJha2MqmKSt9HpKZPu3RMfsn4EWoeOfEHJQ/oO+8izY9QLlh7F1ZTfQJEOIPiYjxmwBHx49QEyONLNNcgNutCzkQOd6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N04Rjsmixb3q6DgH7YNo/nmT09PS4N72kzoT0QMEyYY=;
 b=uO5xGG7tcpg/vup0UpkgoSzucDIGfXCKylYZqtMz8LsGga4mpnFINJVxEjdL5k4H761uAqs6BAbOkUnGm3HSw4MZLImMRtyXtgi9Op3cBbTZ87D6AqRiElvRS5ogM/gmWwlNRbDFEfNvZ6GGBJ/Z2lF2lS5ooU8D6rYc2jEGTe2OfVpg6axe0n4OApbfCKPOrBsCsa6zo7Ricm+ZyVOleiDjqxGZLg98CMq7IM1qjjvjWEE2dNa6GMWysbNzpNyB9wDh1AXCXeIt+NmLos+FIZpxV/gSd/1x+FYzKTmqrEHacJpQlggu9tDUWCeryrxDJHieCXKwRc2rSchObvnpuw==
Received: from GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:f5::20)
 by GV3P280MB1140.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:187::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 22:16:28 +0000
Received: from GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8d1:9ce7:e1d0:838c]) by GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8d1:9ce7:e1d0:838c%4]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 22:16:28 +0000
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers
Thread-Topic: Landlock for sandboxing containers
Thread-Index: AQHchmcrKmIH5n3i4UqE7UAOc5D+DrVU3YIAgAB7kes=
Date: Fri, 16 Jan 2026 22:16:28 +0000
Message-ID:
 <GVZP280MB0902FE3AB14C39026CFC67A0B88DA@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
References:
 <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
 <20260116.id9queiK8oeM@digikod.net>
In-Reply-To: <20260116.id9queiK8oeM@digikod.net>
Accept-Language: en-US, en-ZA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVZP280MB0902:EE_|GV3P280MB1140:EE_
x-ms-office365-filtering-correlation-id: c6d704d6-26dd-4b03-e379-08de554ce539
x-ms-exchange-slblob-mailprops:
 suo+AMQROd7KWLzCSB/8AXewUiiF+4xJD1W1//JJl9wGIh6EdNyyc/Sa1tS+pjqTfIta4oADi/uOqRirggTUDWFdZmEkpdcD96IlEmzW7U+m+yjYKlVvfIH4V7h5i80qYEzw3wMVzPzfsSh9ckCKrhmmX42FpMlVhn4JO+eVU+5ZfwxWZMFYQ8QG7P4Lm7UU5DxoI4O50zbQ1KjIwvorW4xjUvL5mrfpmvKjfsKrO4I77cGffEQTFU62r3ccQ9HemHZ8C6mNcXkl4Ir9jzWWBR5qPpw+mT/cir4AfjYorDdIo7RQT/qtDhgHKpOAo9FdJIsu2EdnWVmPeHKY0fpMzmr4mV6lAa02IJM8BlgTgKtT7SHrhit4MSWL5m/SUlzMq6AnI/sUcfDabCEfn+KT4rYsMTexkHNwGdCTNb+kYIpAhAUW4tkdyEJSMvEjg0sYLbfQd7UqSyFRRNl/oANmuaVSrD5Q+RHdFyU7+/cWDZj+AK6leifG1+wTP8AUDrc2ro84PxpuTOCiSgmzmNkhPXCoEA3tBmLAEDJVc08CTc0dVJnMsLK6np5orD/w2fp1R0qdER86TmGaO1JW4XhoGXTGYkZPoPrCHQCMRrQ8ZUFIZgtmcjBKSDDDnEQbUzkddiVx3te50kn9VhK1AqJem19nSJDCZuNf5jfd5kMajhymi3x4+os1rqNqhTPyDIbExGYVN08bNU9SR2a6IJRiWkRQZkTMZNQo11oKbdZkE8jaNGJrFRko8ZTgppioMa5EAadQ533O4KNGnHYG8OXuz7seZXmRNSBZ5KR1bba6F8DHXmwSu3ZGCrzD0Z+NN4WbCginzTcKMu1s9IinTJgj6w==
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|15080799012|31061999003|8060799015|8062599012|461199028|19110799012|51005399006|4302099013|3412199025|440099028|10035399007|40105399003|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZCNt+maXGj/gzYmFusAtOFsfTpblXMY+D5BdFOc2wvf9esbj3xdxIw6Qbo?=
 =?iso-8859-1?Q?QTsRJh63EPEi0mYz3EYk3QdthO594LdByOBqJ4N5o8bs9GjksiHa1pPlEW?=
 =?iso-8859-1?Q?g033oirxJ+vOxzEeiODwaVFWW82rgsbuXWB+9XPn83ud7v6d+iWUwsm/VU?=
 =?iso-8859-1?Q?3tnhowYhvLkx8QdimiOz/tn3ZkHr5Naqi9Sh9PXquzULH39SWu5R9h9HEr?=
 =?iso-8859-1?Q?UJW1oGy/oPi0HBLdvCGE056AwC8a73opVbOY0uJ3UG4mzLmnD09ILig472?=
 =?iso-8859-1?Q?PIRK663oEgM/J70XMrc5S/Oq/zCcpNQ4NW63dJLKur4vQfhBi7vgTIEGk/?=
 =?iso-8859-1?Q?q7vbUR4ZP7FIokbQkOeRu7TjrhpCV9fhQpo03bv2Z8d2wWK9nHmxOxNH94?=
 =?iso-8859-1?Q?VHrDuxPzvXEOskhwpAZlZz7DkBChQ3+kMtdyM480TVBv/ViMV4W5e0wtXI?=
 =?iso-8859-1?Q?TCkS9TYEyJ8XCjac3WMVgKWIHsyhabr4a1SYHADxqY5KK2ETZdaZsoiulH?=
 =?iso-8859-1?Q?AZ23twJHUx5XcdN6JdlCg5s0d2M3gtkJBK30cFyQaJv4sEg2izG/alGKpQ?=
 =?iso-8859-1?Q?eUMYDuAxihbeDJmUg3GYKibXXHjcZr1RUSR39tk9pOgyMZLnCjnMfM/BXd?=
 =?iso-8859-1?Q?F9PlWcf3sYkHWLZ4R+707eIc70kFujltQ/oGsw72A2gru3A1l1n/zVESbY?=
 =?iso-8859-1?Q?yFo6tbKGls80zarQRzSdcht9NLx9BrK+yu8IqchCxAiIKv9cDxvpXkoeIa?=
 =?iso-8859-1?Q?MPbJKQhrE/aUEfsY0oqRpByuaV+D+Z7pLjWOISFkAMdQ7n2SKa/WPArowu?=
 =?iso-8859-1?Q?s/AvPA3pEj1ebEz9yGp+GPSM8VvZg1IHSO8e9T2jDku956+hAZCKnxjNap?=
 =?iso-8859-1?Q?OFQtTdqJgOGjpe3CMawYccQ2QEEG3wda/wnldh6ZPlw5IVftM8ZGPGgl/9?=
 =?iso-8859-1?Q?m+mLOfSuN2A5SB3PFreSga7/MkzUPZS2sW2GZrust0il828OSDuelTQKon?=
 =?iso-8859-1?Q?ykAOUIrDNDui7tLADLmmbRPqFx6kRwXrWpQsgFv5acAAKVHbTTiaJpAc8d?=
 =?iso-8859-1?Q?i9lhan9DZrlbxiTDH7RVGtwgvKmhjoXcgsNVjxDUF79EXkBKB+XwHARvMk?=
 =?iso-8859-1?Q?MY5zEKE0D+byWfVowmqwxtkIy6PaIZ4ijgY3LixrldlB/mLnE+cyfM9MdI?=
 =?iso-8859-1?Q?mLoImnx6O0pHMETr0Wq3dFtV29fPBSSvgwZvrMx+ySH/y1pmiCcCXcJQY6?=
 =?iso-8859-1?Q?aSQaKYqfMPNM2FGdHN2pC8ngSbSN/GAyzO9RQdQNOdPuxAVumgJ8aMsEM5?=
 =?iso-8859-1?Q?3inmkrmcub2QGZrvIPGrdoj2PE4pI2DFWs1qbXYBoMzpu5I=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?N8dNFjZ6rG2YdALfVeAPXuGZqorxTDmbCo55v7mEPmxHqslGSkFL+IS6a3?=
 =?iso-8859-1?Q?3gK4XV6F1w4/AX3LPo2XYdEzkyorkMBd0l8HtIFKD7TXzYgWEki/WSdlFR?=
 =?iso-8859-1?Q?+qpYcq/Z5zbqK6Ijaj0xpxZa7qYhvqgn4zj5G13+qAphh6ECFTuc0WUkQg?=
 =?iso-8859-1?Q?ce1SqyRNAiTLA2cHq7Z3omrcEUhw05B/F0qz6QBdLGpQtuNrSSvrC3oTCS?=
 =?iso-8859-1?Q?IOoV89NEOtBHkF8XKaHEgEma6gp6397ju/3a9CBOBxohK8BcxwM0Mrcfk9?=
 =?iso-8859-1?Q?Y3aogU8SGZVLON5xTreOfw7yQzWkV1q8/VS0ox1x19kh6jSPmizYLB+fAX?=
 =?iso-8859-1?Q?khpNw6x6H5ftJdJrnCaRDsUMYvhjMUvjOSirFft06o0qgKDT272b0U0EHj?=
 =?iso-8859-1?Q?bCcZ4ZvUUAtHS9J/aT8fewv2yWtL430GhFDmVdtti77QgyRwGv4LMKLO/Q?=
 =?iso-8859-1?Q?uz57CW6zPAoKTF9Vwb9Fl2gFyk+g1ewB2SEmTPj3UgUoFP6p1Vkd5uxvZR?=
 =?iso-8859-1?Q?5fFPsGrOkDaLnaPbVEcINbBqSa+nlfXs0ThfIjbtWL0ScZsvzHqkSu4EA2?=
 =?iso-8859-1?Q?cpQlrnw2vbDvncMYUBC8u/2brgCNO3j5HVRkYGWLZf2q1eHXLOzxmagH2a?=
 =?iso-8859-1?Q?eBAIPlk7drliDKgs/ORun3tcxsccpE6y5wkgmoUprV39LGuU1Dbrzjr/V2?=
 =?iso-8859-1?Q?jKj1mlhfa2IR8NPB539rbWlIxmhQk9h/bUgJTux3lQ9M09z/5watTn3+uF?=
 =?iso-8859-1?Q?XIgnbZIOXC6blRCNs4GwvRZyZj4/YokWHSKh6YaOQY7rTvtAP2Z5cFk9y5?=
 =?iso-8859-1?Q?6AXJtgP7dQyQXAb2b1bshe/riigZvTTCIexvFE+/6YieolP+Q/kD4MGEq2?=
 =?iso-8859-1?Q?FXVLf8KTA7r32dl1zvo52neiTvODSYvJ6X7aEUnKsSlrONQ04hnM3L8+SG?=
 =?iso-8859-1?Q?GPcmp9y0pHUS5/E3Z8iICf4yH2FeLIkHGZ2PykPBXOS2ZaXhAAREtIGbH6?=
 =?iso-8859-1?Q?8IExMj76XTR9eipcdcEFbdX/a+L5GgGLBMJKlbdeMrOA6qAIbEV6cIGhQs?=
 =?iso-8859-1?Q?wwpL/JnGXcYyAiRxALm3DcbWHpB911yOu2ZMfGMsjQlPjhcVfSqrZgxCa4?=
 =?iso-8859-1?Q?G5Kg9hkCVGOyAP5NSTAgVDlBWT3r1089BqRTdKJb9glyQjCcStQy7GTaR7?=
 =?iso-8859-1?Q?zOOyuZTVdpiCJrZqIB1nrzlLQvIeXr81ilvXAUigF73Q1B7hP7NAQhzYeV?=
 =?iso-8859-1?Q?6uQ9hQ0RQu1gwo003XTUv4PJQQaal8GB6VNq470/4+K8LUVcsdP71WC4jK?=
 =?iso-8859-1?Q?O4o3IP1vUw/R6LuE8VHt9X75fwIZAzDGK17Eg4h6MvxoiR7Bi6WCTFvDDF?=
 =?iso-8859-1?Q?Dtv0NBMcxq/pM5CDhqxqLlc4k2mwY2aBr1gx4NLidmRwSiyrwyuFTsuTD1?=
 =?iso-8859-1?Q?oDSDPTfTS7vW2qBD?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d704d6-26dd-4b03-e379-08de554ce539
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 22:16:28.4371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV3P280MB1140

Thanks Micka=EBl! Your feedback is much appreciated and should hopefully be=
 enough to get me going now.

Just another quick question: how much value do you imagine this combination=
 (i.e. mount namespaces + Landlock) adds over regular containers (i.e. just=
 mount namespaces)? Your paper mentions that namespaces are "designed to cr=
eate views of the kernel resources, but not to enforce access control polic=
ies". As a non-expert, it is not obvious to me how namespaces can fail in t=
he enforcement aspect and it would be great if you could elaborate a bit mo=
re on this.

Thanks again for your support and for the awesome project!

Kind regards,
Gerhard
________________________________________
From: Micka=EBl Sala=FCn <mic@digikod.net>
Sent: Friday, January 16, 2026 15:34
To: Gerhard de Clercq <gerharddeclercq@outlook.com>
Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers

On Thu, Jan 15, 2026 at 09:39:49PM +0000, Gerhard de Clercq wrote:
> Good day,

Hi!

>
> I am investigating the feasibility of integrating Landlock into a contain=
er sandboxing utility that I am developing (https://github.com/Gerharddc/li=
tterbox). Essentially Litterbox just makes it easier to setup sandboxed con=
tainers for use as reproducible development environments. The idea here is =
to shield a host system from anything malicious that might show up inside a=
 development environment.
>
> Since Litterbox is built on Podman, my original plan was to use it's buil=
t-in support for SELinux policies in conjunction with Udica for policy gene=
ration. However, since learning about Landlock, it seems that it would be m=
uch easier to integrate and also more cross-platform (given that SELinux su=
pport is rare amongst distros).
>
> After reading https://landlock.io/talks/2024-06-06_landlock-article.pdf, =
Landlock seems very well suited for this purpose. The only thing I am still=
 struggling to wrap my head around is how Landlock integrates with mount na=
mespaces and the implication of that for containers. If I understand correc=
tly, it is currently not possible to enter a mount namespace after entering=
 a sandbox.

If the sandboxed process has the required capabilities (see setns(2)),
it should be allowed to enter an existing namespace, but not to create
new mounts.  Of course, such capabilities should be dropped as soon as
they are not required.


> Hence, I would somehow enter the sandbox only after entering the containe=
r.

This is indeed the best option: setup the namespaces/cgroups and then
sandbox with Landlock (and seccomp for a more complete isolation).

> Is this understanding correct? If so, I suspect I would need to extend Po=
dman itself to do so properly since relying on code inside the container to=
 enter the sandbox on startup seems like something that could easily be att=
acked.

I would suggest to first wrap the build command with a sandboxer tool
(Island or others, see https://landlock.io/integrations/) and make
Podman launch this wrapper (directly or through an init service).  That
would allow you to quickly iterate and validate that it works as
expected.  If this sandboxer tool and the related configuration cannot
be tampered from within the container, it should be good.

A cleaner but more complex approach would be to patch Podman to do it
more generically and without a wrapper.

>
> Any additional thoughts or suggestions on this endeavour would be greatly=
 appreciated!
>
> Kind regards,
> Gerhard de Clercq
