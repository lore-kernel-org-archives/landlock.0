Received: from MM0P280CU009.outbound.protection.outlook.com (mail-swedensouthazolkn19011039.outbound.protection.outlook.com [52.103.34.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3031F33E34E
	for <landlock@lists.linux.dev>; Thu, 12 Mar 2026 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.34.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342226; cv=fail; b=ooKLeUF9IiYAuXTMMFjKbeayX1JLwEziSdiUHk16+I/Z9aVCm5Oj7h5+EUE6nomQImKBzl9qQ5NwxxJbcmq8LHzSyFrrLKDKkKSq0lKuZ9PoDiv/n3MgADwmQ5Xmq+9bofEVpDbdSJytigoNU3Xd2aQpNGmnhiYcaYVwrpvRNtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342226; c=relaxed/simple;
	bh=/1BWTJ+MVda9CWXHIkAJCc0zj3DiObYWZY5P90Ce7Ng=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hAI3rbrRg/tH5FFw5MEa4GbTH8MdP0s+RujhUVSI7F674GhaUmAlN7RMOw30aTZ8Hr+7+oQsWzzCmI0xkqOlVdca0LeH/1W5wRY6GsBcZ1p4oBw/HPQyhkX4YHo+fiY01WiFuvSQnHyCgLbrBBklLiGPEryWS/Ck7AASznJh/K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=conic2hl; arc=fail smtp.client-ip=52.103.34.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="conic2hl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwX8t5VzmUIe4TsrpvbVHFPC/us699ohTGlZS6zt2QNyR3FJRzrqY+/WQ3QCYToGnPWqcngP2GIAGWQMt0UKTMozM9nO2/jS8eZNUz1NBnVIadnefJNFEVIQNjhdQApdX0XUWiRQ8m3bYVaYNDg27XY3p+MpudoldtAXQ8iT38nUF/0S73QD45veAaJXUaXr/VD0vKlu+b1dEj0KCrlIm7N5EJ064lZyzO1XTrkKRJIRxNT7CnsbxIrioBHwjtEzjz0kFzj8h5R0KfuxFj8nuoHagR90VJBPqf1uFZc2TeGlG5Tgb28tma7BlVZGmIvEdWODk6LZGn6okamWFMEBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdgtCELRmkwszYhpS2kIJMqVbgVFsuNJFfkq3407V1I=;
 b=P4UCWS/Ix9ugKLHK+iQLAcpTPRJChDFZHW0r7CyJz3TETi5M4MBu20N8VZz660lDronqnM7Ems+ZFPcx2Ta8seLGtRTmoavXpZ3tpcRA3e3i/S8c6WzIxBGd3LL8mu1Rl+xt5YxkBiLcp+AheYQSZ0hifGhpO0ONnvUlMhSHwhCuqXKsYKd5dvR2rj2P21WQCf+OBtNOplxX+6Ecql5W8KFcrJBQIVMdfTgKFYFuGNvILwRb2D5BDpVhuGdydsCn00nhWp9aD8ivBIoQzSBmIOy5sElek0VPRMplxUIMDQqlyY8XAV8Y7SFJqTLOB0vU7qqNQAxqnw2v6im1dSfdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdgtCELRmkwszYhpS2kIJMqVbgVFsuNJFfkq3407V1I=;
 b=conic2hlueA8CaL+0Mjj6Kp2t1TqCn1KNwA1XHab3MiALjlCWWZHig8xJ4MuwbS7orPNYzArfhAP5UQZK1Si1oipgstJqUAa26rMmabjXTUOQkhFphj81YUrDdiWuoPZKb4KPaPkGdlmgWrdLw8Uuc5K8i3kiFiXjuwyFJWURqFgD5OEpsaPhW7v301j3dTGcGOzCivl7lakKopN0tFbzcknXExtFkxD/tyatdqsWovXXfsk+LzH0KaLwg8Hlge//IPI6j9JZwRQNTBjbecpGt5eHo9MEDIGaofjaRmXYTVYJHm/v+XWVDtnZ6GRmzUe+C9Qobgz6wRrG05hYck18A==
Received: from GVYP280MB0912.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:eb::7) by
 MM0P280MB2087.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:21::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.15; Thu, 12 Mar 2026 19:03:40 +0000
Received: from GVYP280MB0912.SWEP280.PROD.OUTLOOK.COM
 ([fe80::9951:51b:eab:4e14]) by GVYP280MB0912.SWEP280.PROD.OUTLOOK.COM
 ([fe80::9951:51b:eab:4e14%7]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 19:03:39 +0000
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers
Thread-Topic: Landlock for sandboxing containers
Thread-Index: AQHchmcrKmIH5n3i4UqE7UAOc5D+DrVU3YIAgAB7keuABAM+AIAIE6m8
Date: Thu, 12 Mar 2026 19:03:38 +0000
Message-ID:
 <GVZP280MB09026DA2823C512F46499945B895A@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
References:
 <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
 <20260116.id9queiK8oeM@digikod.net>
 <GVZP280MB0902FE3AB14C39026CFC67A0B88DA@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
 <20260119.eiphie8iNgu2@digikod.net>
In-Reply-To: <20260119.eiphie8iNgu2@digikod.net>
Accept-Language: en-US, en-ZA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVYP280MB0912:EE_|MM0P280MB2087:EE_
x-ms-office365-filtering-correlation-id: 01735925-e55d-4bf0-9f54-08de806a11f2
x-microsoft-antispam:
 BCL:0;ARA:14566002|37011999003|25031999004|15080799012|8062599012|8060799015|15030799006|461199028|31061999003|19110799012|51005399006|10035399007|4302099013|3412199025|440099028|102099032|56899033|1602099012|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xdQKq/IqInsqHPkhKQOZ5K+YcFP8XRvAranbxVr2eTrLn5abBJ49/1Nn2K?=
 =?iso-8859-1?Q?WXRcEWfBMVrJd/vBPn+kkfOscaiNVrxKKHYwzO/30MUTcaf0i0VJiwJyFZ?=
 =?iso-8859-1?Q?ufJnWdMU4OCNKu+sKVlm2qSB3Hz7Fw6vjXlREv2PqQ+U0RN2F2HNtqCQCO?=
 =?iso-8859-1?Q?FarF/tiEMNjdGD8xkt6mWl1nlw0zPeYsU7PCaWlugxtTyNsu+LG0ZziHpG?=
 =?iso-8859-1?Q?UeIZZDKyZy+vcON3FzBv0VPpSoofxkeiOTHsCV+oZxPfFGh+04zvAVICKo?=
 =?iso-8859-1?Q?s3kwSzH8msTZnvJFr7rvZGVLhwFifgLPphHEWGkoFYKyELErXsrotOFAx9?=
 =?iso-8859-1?Q?sT93+qjDrBiFMPsdjwyHU/Tplk/OxhL0vN+Losn+pt37d7DGlU33qQY6x1?=
 =?iso-8859-1?Q?AXVrjF5ci0rAicVymiuz86MSVfQKv6QAh1hxQiGDQ1V1uYuRj9GvMvbJku?=
 =?iso-8859-1?Q?L4ef4r3jo/U7uKq0qdxuwybvHHo5HSeqd23xsazdPiRkVMGhC23936sDb6?=
 =?iso-8859-1?Q?JYEaWcLftkzKEyrT3diWeWMemknty+h4HyjCLL5JtNER8ennWxJ8poytmz?=
 =?iso-8859-1?Q?Y+El4VXENGa9T4gFGFbkK8C0BZitNb/tPbQGIv9iwgGbShdONN/mPA2e/u?=
 =?iso-8859-1?Q?TmVS6czzy3BX4uk13ZnCQg/9BLXI8OgecKYwvClB4Uh1F6lWIz4586jlba?=
 =?iso-8859-1?Q?yKlr2OiANEwf3hk2iJrlHtxlbfMhUqRY6qvOpttD9QgIstaT7dstqtk3Wx?=
 =?iso-8859-1?Q?19AlSE6DX2n+jza7w+pbQgO/bpZv0fcutS7Lb+8fWm/RzW1wt4Sh9Uunfi?=
 =?iso-8859-1?Q?xgfXGls3FmqwGTAl9c/5bcp9hVbR2FW2iYg5Atvoqo9xef4cqzCZTJQaHB?=
 =?iso-8859-1?Q?F1tmmhmoxdmqjz1UKTwt7Qm6sjTNFlDzC/SpiH6Y+LKY/S3sMWKvREpTfl?=
 =?iso-8859-1?Q?w+tOBXcSg1lcXpy9+Zbj4KBA9aY7AQyQQr70wcO2ovRyIEOr6KA3ztVaDn?=
 =?iso-8859-1?Q?g5pkmE2+AhzO4DGU6ACM4paeuVypn+lZel7Mzbs9DUfcMDO9Wte3eZKHdG?=
 =?iso-8859-1?Q?Qgih8LN14Texq4R8mHzBzTs5T3xI3XOWpx6dymRTXwQoctLY+gN07uu1vO?=
 =?iso-8859-1?Q?48QWVUHQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YR/HnaV6Iv2x8iYnvqcVxulUzGVgeHUl20nhuWzP/EXuTH7NLHFslvD4Sz?=
 =?iso-8859-1?Q?/SGJuVGuK1ATFcyghqguWQj8OshToeNi8RJ8/AvmgX4NWL/2dJ28cs+4FF?=
 =?iso-8859-1?Q?AY4qRgLt9gJt+ttVWfCBMOLWgwvkypeFsiXi9hf1oNC0m77IV+OXZ6w9HH?=
 =?iso-8859-1?Q?GAsPhfNjUR3wwKgekjeAh7i2YR3jwkGGgg6aLv/veqXf34pvQV5hTMq1wG?=
 =?iso-8859-1?Q?XxgYHb/CfcyXqnudErpWh/dq/FSX0tQfpNqYJkcJf9ymUYHYZ7ACNTyTnW?=
 =?iso-8859-1?Q?RIxKohV9FUE7Zr9obJggnNKr9yoCUBGAy8wbOCdhfBGB0ck6BP01cqn3Gx?=
 =?iso-8859-1?Q?IH16PHOaoakPxwZIOSCouuW38+9/sHPMJvQbbn/jGBkVY4dw5qrZChOcuI?=
 =?iso-8859-1?Q?eeC+drRo2q+lW2CeOd6lP0jUI9hEIzF6YYaiw6VI/WIWF5R3i5NAn1eNLF?=
 =?iso-8859-1?Q?dlka4O0wJo9R3suOT7W0qdPatmS7lKSVyy8tOldKiBllBW2JcGYWJXUxu1?=
 =?iso-8859-1?Q?Bdezhqz4eMCVYwpoRnzkB0ODmGQxYSGreC2b/eB/vjVT4jbti7sQ6spKhm?=
 =?iso-8859-1?Q?QNl3iikPnZLXpbLZhaUHZUAi528bjPIFGbEcBDGHRGtb5PIrYgBCYN+COo?=
 =?iso-8859-1?Q?Nc0+fe9cJmC6WUODzl0Jd1yZCLVSYcvq5x2XUam+5Wb3TNZ4DYI10C19Ox?=
 =?iso-8859-1?Q?zUpSUScDbZc5CF2Du3AUs9c4h5bXhLoeA/aaAmS/WDbrkVk2D+PCvJ4Ytl?=
 =?iso-8859-1?Q?UoyPbK3NtZsiHbnNipma4iC2dJ5ZGYH+jy6dw6YHnwIFkBI2EIaHmn3lXQ?=
 =?iso-8859-1?Q?+4QlF0KH72YJ20NWZexy4NoKU7PXS/ErBc2BdrWL2HXtrqzLykpHRkCU+6?=
 =?iso-8859-1?Q?QiIaRU2YkDNCSyfMbVdKdZlk3kyXk5NV/pNUf5DtX7RdyfgELR9vA+xZlm?=
 =?iso-8859-1?Q?hWaJIifWZrC1I5yP6xvTwOTVIXR2lYbv4NZn03ecdvxUfjEI+Ttwe7GqZV?=
 =?iso-8859-1?Q?NF5PttYQtv9duwV8M+UYMrUon/xInBYOc3ksnZbzoX6Nq/EkuOVaPHLXjS?=
 =?iso-8859-1?Q?pr6qQIZUbYv5YuR9k6sEKSd137HIcQSunayIDmL/2M4A4KQ7Jegy5wmeIu?=
 =?iso-8859-1?Q?u/v1vOh9qGd8a6ILeMVfD/KMqUG9/MnzY8v3l+Yy+PLd5Z/MlDoxtZfWe6?=
 =?iso-8859-1?Q?GbYDN5sNfYZmW0upMd6GVCMImzMyAfPWtTReZVTQZz4EDVCKNN20arMsLE?=
 =?iso-8859-1?Q?2eTF87+/UuShQwganU3wucjOTVJj2RDdnTPpDhI7NmmRYHq48YqxIaQ0Uv?=
 =?iso-8859-1?Q?k/qfcKyeXdaW1vAaRgGaRzM0RBlCoqiC9Dl5nUgs0dhhssyXwTOSNcedtd?=
 =?iso-8859-1?Q?2ue+X+3ZM1glNkKancitBu11BkobGuJAn/m4w0BVLX5FM7euU0IiFY9Pyo?=
 =?iso-8859-1?Q?Fyh8BQufSyv72nLq?=
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
X-MS-Exchange-CrossTenant-AuthSource: GVYP280MB0912.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 01735925-e55d-4bf0-9f54-08de806a11f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 19:03:38.8152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MM0P280MB2087

Thanks for the clarification Micka=EBl!

I've now finally managed to start integrating Landlock into Litterbox at ht=
tps://github.com/Gerharddc/litterbox/blob/landlock/litterbox/src/sandbox.rs=
. Until recently, I did not have a good place for this integration, but now=
 the Litterbox architecture changed so that a specific binary is always run=
 as the "entrypoint" for a session inside a container. Hence, I can now sim=
ply sandbox that binary upon entry.

This seems to work well, but it has broken the ability to run sudo inside t=
he container. To be clear, Litterbox always uses "rootless" containers so t=
his is not the true root user, but it is still nice to have a "virtual" roo=
t user inside the container for added security. What I run into now is the =
following error:

user@lbx-ubu ~ [SIGSEGV]> sudo apt update
sudo: The "no new privileges" flag is set, which prevents sudo from running=
 as root.
sudo: If sudo is running in a container, you may need to adjust the contain=
er configuration to disable the flag.

Is there any way around this or is this a fundamental limitation with Landl=
ock?

The only workaround I can currently think of would require users to enter a=
 new session explicitly as the root user when needed. This would be very aw=
kward compared to just using sudo in an existing session though.

Kind regards,
Gerhard
________________________________________
From: Micka=EBl Sala=FCn <mic@digikod.net>
Sent: Monday, January 19, 2026 12:12
To: Gerhard de Clercq <gerharddeclercq@outlook.com>
Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers

On Fri, Jan 16, 2026 at 10:16:28PM +0000, Gerhard de Clercq wrote:
> Thanks Micka=EBl! Your feedback is much appreciated and should hopefully =
be enough to get me going now.
>
> Just another quick question: how much value do you imagine this combinati=
on (i.e. mount namespaces + Landlock) adds over regular containers (i.e. ju=
st mount namespaces)? Your paper mentions that namespaces are "designed to =
create views of the kernel resources, but not to enforce access control pol=
icies". As a non-expert, it is not obvious to me how namespaces can fail in=
 the enforcement aspect and it would be great if you could elaborate a bit =
more on this.

Namespaces are tools used to build containers.  An access control
doesn't change files layout but it (just) controls access to all
potential files.  For instance, with only namespaces, a process in a
container can still access files outside its mount namespaces e.g., with
passed file descriptors or unexpected (recursive) bind mounts.  It's not
the role of namespaces to prevent that, it's the role of access control
systems such as Landlock.  Another thing is that mount points can only
restrict broad operations (i.e. write and execution), not all kind of
operations that can be handled by access control systems (e.g., IOCTL,
file type creation, connection to UNIX socket...).

Namespaces are more complex, require more memory and resources compared
to Landlock domains/sandboxes.  Landlock is designed to be used by any
process, even nested in other sandboxes, and malicious processes, which
is not the case for namespaces.  And because file layout remain the
same, it's much easier to know what files we are dealing with.

In a nutshell both are complementary, but if you're looking for security
restrictions, you're looking for an access control system.

>
> Thanks again for your support and for the awesome project!

Thanks!

>
> Kind regards,
> Gerhard
> ________________________________________
> From: Micka=EBl Sala=FCn <mic@digikod.net>
> Sent: Friday, January 16, 2026 15:34
> To: Gerhard de Clercq <gerharddeclercq@outlook.com>
> Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
> Subject: Re: Landlock for sandboxing containers
>
> On Thu, Jan 15, 2026 at 09:39:49PM +0000, Gerhard de Clercq wrote:
> > Good day,
>
> Hi!
>
> >
> > I am investigating the feasibility of integrating Landlock into a conta=
iner sandboxing utility that I am developing (https://github.com/Gerharddc/=
litterbox). Essentially Litterbox just makes it easier to setup sandboxed c=
ontainers for use as reproducible development environments. The idea here i=
s to shield a host system from anything malicious that might show up inside=
 a development environment.
> >
> > Since Litterbox is built on Podman, my original plan was to use it's bu=
ilt-in support for SELinux policies in conjunction with Udica for policy ge=
neration. However, since learning about Landlock, it seems that it would be=
 much easier to integrate and also more cross-platform (given that SELinux =
support is rare amongst distros).
> >
> > After reading https://landlock.io/talks/2024-06-06_landlock-article.pdf=
, Landlock seems very well suited for this purpose. The only thing I am sti=
ll struggling to wrap my head around is how Landlock integrates with mount =
namespaces and the implication of that for containers. If I understand corr=
ectly, it is currently not possible to enter a mount namespace after enteri=
ng a sandbox.
>
> If the sandboxed process has the required capabilities (see setns(2)),
> it should be allowed to enter an existing namespace, but not to create
> new mounts.  Of course, such capabilities should be dropped as soon as
> they are not required.
>
>
> > Hence, I would somehow enter the sandbox only after entering the contai=
ner.
>
> This is indeed the best option: setup the namespaces/cgroups and then
> sandbox with Landlock (and seccomp for a more complete isolation).
>
> > Is this understanding correct? If so, I suspect I would need to extend =
Podman itself to do so properly since relying on code inside the container =
to enter the sandbox on startup seems like something that could easily be a=
ttacked.
>
> I would suggest to first wrap the build command with a sandboxer tool
> (Island or others, see https://landlock.io/integrations/) and make
> Podman launch this wrapper (directly or through an init service).  That
> would allow you to quickly iterate and validate that it works as
> expected.  If this sandboxer tool and the related configuration cannot
> be tampered from within the container, it should be good.
>
> A cleaner but more complex approach would be to patch Podman to do it
> more generically and without a wrapper.
>
> >
> > Any additional thoughts or suggestions on this endeavour would be great=
ly appreciated!
> >
> > Kind regards,
> > Gerhard de Clercq
>
