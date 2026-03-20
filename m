Received: from GVZP280CU018.outbound.protection.outlook.com (mail-swedencentralazolkn19012064.outbound.protection.outlook.com [52.103.35.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2932AE68
	for <landlock@lists.linux.dev>; Fri, 20 Mar 2026 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027105; cv=fail; b=hTxJ3f0VNvY3OPW5WHdGAlHAGIPoNTWgcGQWFCNDq3pYCiYAOkudk2UKblB29Ab80o7WP00mQSFixBZ5Lx+k/4V9iwWiI0s9CMdmSAQLBlU4CljtpqSJ5Y/l5Qf2tUlulJRopv2LJJoR+cqga1U2ZL56Bt2k07wsRyEibWpueoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027105; c=relaxed/simple;
	bh=vEiQ++fwQBAi/DFYGLRAdXfSBhEKAxPPCIl9Stb3G0M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uk2fPiPAEKVL2aw7byTPTg6uniS3R8JqMyV5eWeJsSSIuf/l/T6emi/4gjC1sPyn4O6wYDpfOolNwJEmRCFFrKYUCy/VoDO0vmj1YgHX4TSizy4jReNrJFdYIjmDxti6Z1RG0p25MuhSOMdEL+IHXbRgG71fI/9U2evqJaT/V08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=B9FrwFo2; arc=fail smtp.client-ip=52.103.35.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="B9FrwFo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2u1xfusFUFDUpxA/3MQWUWYw59ZXAlMclCeMuCe0mBb1NW6NnAlJU1Rbq1gK/g5rRqxVwVbIfoc5Fr2XxIrutrRX9PubOucICuRszf0ADVdhK1lpR3uH7RKNYAiaMrq7KZhLlnbJpB/DuPzLJO4NfQwbD5+5ot4c2u37lPmUXmZLh+SWXdae8xhQyxYIBDPYlJ7TmInO/eOUwYCNF7crco8i42jCjExdIIQ+DVv+CTs5hyhW+m9wyMNvJlfbLkcmCyte3w1UmfnqChEiwcr8EHL0zZug1FTM3ATHM7KS43t6DGnIrma0353whKEDPzxzqWdQPXYulb8Ps1M1gMn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PYBXZ7Py/3iF7xV6PGcGjLG/dsQJar0lobyj2AfsYc=;
 b=RcIc1EXa7dpGt7F5An/1+Kya15I/tHTV2PsXrUIjg9vtTi4/MomJt5OTwJfSS4RuEN+xpCPjB15/ncSV6jpGBOmhy16QF2GizaFmJj472bi6puatsWBNBhhRBTcIOvDrGdXbOVIbJ8UyOtCUe48nXHntEgIst1bEmBGDxNKuCmlVWZ3cn++quNpgsC2r+XmZl+r//vY4cGQLAYFKEEPg1pVw7cbd/rw8h0Ii6n1xGySn5BHTLonMEDVOWp8TGEtMUpCAFt3IxLpARCy+L83XMeka7ovJLXEfAm3O0FLqFtGYEYPSbsHbrCIv29YNgCNwsvORWBjaSPOXkj8lmHZPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PYBXZ7Py/3iF7xV6PGcGjLG/dsQJar0lobyj2AfsYc=;
 b=B9FrwFo2eo6VXzxTJkOya9BDN/W4D1/qLG6BSntdBVAEADaB6u6y77FtLf7RMx2jbwWhfnCiDO9E/myXlFhkkMHjpjjFjHdPN+hFp373OLtFIitdlJAlJTYvj+cpGAK18UZ2ko4rnjOK5oQM/LSIaGzkRWswNSahMWHIuZfPDt+pH2Wa0SrW1Vp2gZ0LswGfld27TubqMaP2ACrFwYWRwiw4KO5LpIYOiQ8Fq0FPf0x5V1vIXpR+2mMN4/0FV6i/QqX0zXi7oTZ2c12YRXNTY5lMkh4d+WugGhPjv3LslCEQ/+IAEQTegcJG5OnSZhPCoL5GYeCkKx8Niu+NiIi80A==
Received: from GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:f5::20)
 by MM0P280MB0135.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 17:18:19 +0000
Received: from GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8d1:9ce7:e1d0:838c]) by GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8d1:9ce7:e1d0:838c%6]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 17:18:19 +0000
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers
Thread-Topic: Landlock for sandboxing containers
Thread-Index:
 AQHchmcrKmIH5n3i4UqE7UAOc5D+DrVU3YIAgAB7keuABAM+AIAIE6m8gFZ+CACAABz6fQ==
Date: Fri, 20 Mar 2026 17:18:19 +0000
Message-ID:
 <GVYP280MB0912617C5BC2047948FACC2FB84CA@GVYP280MB0912.SWEP280.PROD.OUTLOOK.COM>
References:
 <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
 <20260116.id9queiK8oeM@digikod.net>
 <GVZP280MB0902FE3AB14C39026CFC67A0B88DA@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
 <20260119.eiphie8iNgu2@digikod.net>
 <GVZP280MB09026DA2823C512F46499945B895A@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
 <20260320.fiayeH8wio0i@digikod.net>
In-Reply-To: <20260320.fiayeH8wio0i@digikod.net>
Accept-Language: en-US, en-ZA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVZP280MB0902:EE_|MM0P280MB0135:EE_
x-ms-office365-filtering-correlation-id: 69eac810-4b08-4d75-ba9c-08de86a4aea5
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|15080799012|8062599012|8060799015|37011999003|25031999004|31061999003|12121999013|51005399006|461199028|15030799006|56899033|1602099012|40105399003|4302099013|3412199025|440099028|10035399007|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/a07pA/8IZZpM1NHATPvXEhw/KD1ErO4VMqTi2DyRnBcMB95GhnDYzyOC4?=
 =?iso-8859-1?Q?hJbkl3aAYafWzg66HMLN9vHnXIWdrrjMScQgdBbvjV6kTvVlVaG4stUd8q?=
 =?iso-8859-1?Q?rvvtuXs7ruEWE++UkJnn8vGCnrsoVDvr4ZPi6MbvT4s8uJ9pgEffl8VXcu?=
 =?iso-8859-1?Q?TKYrTcbfFCrbxoRZ43fBQSdSt7Tjc/Ni7nHUXlfsULo+eNcmiEDooC+Qce?=
 =?iso-8859-1?Q?TggHmDRe5C8QP9O4GQf1+8rNZ+zp26MwOEzJCq82HA3d+ZKbeDlW7v/hxI?=
 =?iso-8859-1?Q?myhQ+x8pvAF7FosmBDwVL49qsuRsb73wIzTsBWn1wVP/xv7k+5FdMGAOXf?=
 =?iso-8859-1?Q?CPkrC52+lC2QBaw5kMNkLca9uvjDJ87GFW7PTKzdxex2LwhzDRCY7YiaDN?=
 =?iso-8859-1?Q?1QCjoWH37anGi/rn/I4+Nc7TgLx+T45RlBAdSGCypzvH0/Lxc/sFFG1mLx?=
 =?iso-8859-1?Q?j7Rvh8pefoSXMEIgPboc/MZSCqByLvbb837Qu4JIGG45RFSMg2afsqly4K?=
 =?iso-8859-1?Q?kJS5hoY5d7uIQ/t0sUFn3e35S5CTsuvvSh4+2S/rAJUs5ywRhIy33ml60L?=
 =?iso-8859-1?Q?foQS58iVsusF6iW4NuoWcrOUheeYsh2aGthQMRLaN50PzY1qSXulmOtLh7?=
 =?iso-8859-1?Q?hR4G1PKDnUqo5XYLLotCjFgUUwNH9PQ2kxbaL90nEIUV5LEoFc6j0k6QcW?=
 =?iso-8859-1?Q?6YXBpB75q5b8UYE1J/aWi79fyVTVsbMAjqTmGNvna52DNxE7PiZuV+Pshj?=
 =?iso-8859-1?Q?eKSz//uJvengrc4vItMunNZALgxizbSRESejDQHOHRTOwjY2Gu+U5U9uyc?=
 =?iso-8859-1?Q?QW2Vl3gX2GVTJy5ZddbwbwkofdELW64eSAnuV73HtLk7pYz9hzrNBMC9pL?=
 =?iso-8859-1?Q?89oaFp7o7BFNTkgKO3HsvxRo2J7UnkmXXVj8tp+lNghOdBfs24a4a5O9WJ?=
 =?iso-8859-1?Q?oasEFFlpHKSXoDk9ZvEQG3OUfHu1AYXLwwvU4tFg91nqWiOse+/q1UU+TH?=
 =?iso-8859-1?Q?tttKVWlE2c3prFqllvgsElrC0eL/I+V6UVVeBt2fE/Tdnc9uzb0qFjbxzg?=
 =?iso-8859-1?Q?29OtUR5/HX5TC4QPAwsWeOgGvp4K4M3OBQQbkHTmcyTENvwQZ7GK6O28yT?=
 =?iso-8859-1?Q?Z/m6o61PnPYaC/t4u/Sbl3/EsOLgM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nL0xowGtacIPvFMM1GnWy1NiU63Ad/iTTYINfUVuhIEKclDDswTGX2gJv1?=
 =?iso-8859-1?Q?4v/Skyl2bJuX7U4LO5euK93zEw15uC2sDkOLFmZ8nTDVla9km5DDrXOR0O?=
 =?iso-8859-1?Q?GzZM6j/m2XSMGs+MowOorXtJ1SoKnfop56Qw7ZccSuiKtd2W1Y9pcuY5wG?=
 =?iso-8859-1?Q?zVPMNX6vYfIVzteNtqTPh0BUR2Ck47karT96svqFyHQpq/iEkRkSC8McOB?=
 =?iso-8859-1?Q?9SwQBgKqucXZ7+tEuk3zN5lKKv2Bg37f82zM8cX4gGxpTTr2Nf4z5YUUzC?=
 =?iso-8859-1?Q?JBVCcNvxMh2RIXHFJwLX6jvq8Hbmgcd8La0Szl0zT8qEJJqZrAYkxoRJ8A?=
 =?iso-8859-1?Q?WCUxuQ5sUdJl4n9j+BoVTwtzZMe/pRp86dFNGlL6VcndvMCX2vaVSgb8Qa?=
 =?iso-8859-1?Q?crQ/ysvvxPuAdGURJieAdKlO2gsmrYNwN2ClfJ/gyDi0YfGehVfN2g4W6z?=
 =?iso-8859-1?Q?65yr3Cj2JMSmgcm+4TmV1VyHvdM4dwCvFStwtTUp7t51bnbL2d36dPpIOk?=
 =?iso-8859-1?Q?wuHq9vxOHoo/PAw1qy+f7s1NUjTx42nHfKvt/GTFN0fm0nJr8QzHeiTnIp?=
 =?iso-8859-1?Q?FWPI/53Rd9hhsrAUC3hf0OBJ3Abb81D1Rw4wqOl7TYUvSDTZ+XYaMgJmu2?=
 =?iso-8859-1?Q?N46knunOktiWWoG4zWlA0kPxyMUcd4gshCQN7wdCYHM0UjsowlIGoR7+37?=
 =?iso-8859-1?Q?aOAr67R894mZ3BZuYP6Iz4do9V974wfuk96ShqYn/hQekZ4moFlUKQh8y5?=
 =?iso-8859-1?Q?YFXvPjKLrUsGAHQbrZ3YOacnD+TfAimsPRm3uiPOuJzjogMeR+tWdymAMy?=
 =?iso-8859-1?Q?9Se1aw1CCn1AzhO80Xw2JeUwqzgVrDvIjm5wZAKfpZt85e4qTVOjURs6aX?=
 =?iso-8859-1?Q?eF5HXhY6fIhVMzxCate7YY4sSSdzSqSpHw3CD5jIHqcfLgbhOzuPUdL2Em?=
 =?iso-8859-1?Q?+IdoVRPcI2ydscRvL4knBu+WCRiZCQJicnQhnER6M6zCvEXoqy/cnD67pu?=
 =?iso-8859-1?Q?yxzH/ZXJ5la8qRFGe5qEPx2ImSjbwdFzGk9hDLemvick1T2u8CLJj19lmp?=
 =?iso-8859-1?Q?fwPMjKWLV/rjACX3oe22+FB4C9fN28Y5gSoXInPAMPNhWh8c+2prQsPpWV?=
 =?iso-8859-1?Q?Owg1shnaPzBJ0Fmu0QvpA+3gb03/e2SdL3VJ14/c29N4LwhbY92yGXSsp6?=
 =?iso-8859-1?Q?4qjaePdP+RljHuOGoUKLpAWoIK6gGoTz1+0JPRtMWD5GX5rV2pqA8l+QVR?=
 =?iso-8859-1?Q?G2DVjPh5woaILHH+OrrZDLCbZxYZVeQcENFj4zfXw4rSVCehhmxHKEgI7A?=
 =?iso-8859-1?Q?YOqyWfqo7wRs5dUiWPBGhSCediIAk3VGMTPmWIT73unDrpay37UjR08mKx?=
 =?iso-8859-1?Q?gzX77fNhRdyL6EBYRMTibWmK2azRkU6nZu78ZrKuas3ag7RHqgr8RoSiyt?=
 =?iso-8859-1?Q?aupRR3pWttnJKFwO?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69eac810-4b08-4d75-ba9c-08de86a4aea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 17:18:19.5582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MM0P280MB0135

Understood, thanks for the clarifications and the additional information.

I ended up just working around this issue by requiring sessions to be enter=
ed as root explicitly when needed. Thankfully this is no longer so painful =
because recent architectural changes added functionality to easily enter mu=
ltiple sessions on the same running container. So now I've just ditched the=
 sudo binary in the container completely and replaced it with a symlink tha=
t informs the user to enter a new session as root instead. It will be a bit=
 awkward in some situations but seems to be a more secure and simple soluti=
on overall.

This was recently merged in https://github.com/Gerharddc/litterbox/pull/60 =
and will be included in the next release.

Kind regards,
Gerhard

________________________________________
From: Micka=EBl Sala=FCn <mic@digikod.net>
Sent: Friday, March 20, 2026 16:22
To: Gerhard de Clercq <gerharddeclercq@outlook.com>
Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers

On Thu, Mar 12, 2026 at 07:03:38PM +0000, Gerhard de Clercq wrote:
> Thanks for the clarification Micka=EBl!
>
> I've now finally managed to start integrating Landlock into Litterbox at =
https://github.com/Gerharddc/litterbox/blob/landlock/litterbox/src/sandbox.=
rs. Until recently, I did not have a good place for this integration, but n=
ow the Litterbox architecture changed so that a specific binary is always r=
un as the "entrypoint" for a session inside a container. Hence, I can now s=
imply sandbox that binary upon entry.
>
> This seems to work well, but it has broken the ability to run sudo inside=
 the container. To be clear, Litterbox always uses "rootless" containers so=
 this is not the true root user, but it is still nice to have a "virtual" r=
oot user inside the container for added security. What I run into now is th=
e following error:
>
> user@lbx-ubu ~ [SIGSEGV]> sudo apt update
> sudo: The "no new privileges" flag is set, which prevents sudo from runni=
ng as root.
> sudo: If sudo is running in a container, you may need to adjust the conta=
iner configuration to disable the flag.
>
> Is there any way around this or is this a fundamental limitation with Lan=
dlock?

If the process has CAP_SYS_ADMIN it can call landlock_restrict_self()
without no_new_privileges.  This is the exact same check as seccomp
does.  The goal is to avoid privilege escalation via SUID binaries (e.g.
confused deputy attacks).  SUID binaries should not be
available/required in a sandboxed/secured environment because this
mechanism is not consistent with the principle of least privilege.  The
best alternative, if the required feature is really needed, is to rely
on dedicated and secure services (e.g. checking the peer identity)
available through UNIX sockets.

>
> The only workaround I can currently think of would require users to enter=
 a new session explicitly as the root user when needed. This would be very =
awkward compared to just using sudo in an existing session though.

sudo, which is a SUID binary, is also dangerous if reachable by
untrusted processes (see related security vulnerabilities).

Another approach would be to have different execution environments, one
which is not sandboxed (an admin-like environment), and the others which
are properly sandboxed.

We can also think about using things such as SSH but of course this
could also be a way to escape the sandbox.

>
> Kind regards,
> Gerhard
> ________________________________________
> From: Micka=EBl Sala=FCn <mic@digikod.net>
> Sent: Monday, January 19, 2026 12:12
> To: Gerhard de Clercq <gerharddeclercq@outlook.com>
> Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
> Subject: Re: Landlock for sandboxing containers
>
> On Fri, Jan 16, 2026 at 10:16:28PM +0000, Gerhard de Clercq wrote:
> > Thanks Micka=EBl! Your feedback is much appreciated and should hopefull=
y be enough to get me going now.
> >
> > Just another quick question: how much value do you imagine this combina=
tion (i.e. mount namespaces + Landlock) adds over regular containers (i.e. =
just mount namespaces)? Your paper mentions that namespaces are "designed t=
o create views of the kernel resources, but not to enforce access control p=
olicies". As a non-expert, it is not obvious to me how namespaces can fail =
in the enforcement aspect and it would be great if you could elaborate a bi=
t more on this.
>
> Namespaces are tools used to build containers.  An access control
> doesn't change files layout but it (just) controls access to all
> potential files.  For instance, with only namespaces, a process in a
> container can still access files outside its mount namespaces e.g., with
> passed file descriptors or unexpected (recursive) bind mounts.  It's not
> the role of namespaces to prevent that, it's the role of access control
> systems such as Landlock.  Another thing is that mount points can only
> restrict broad operations (i.e. write and execution), not all kind of
> operations that can be handled by access control systems (e.g., IOCTL,
> file type creation, connection to UNIX socket...).
>
> Namespaces are more complex, require more memory and resources compared
> to Landlock domains/sandboxes.  Landlock is designed to be used by any
> process, even nested in other sandboxes, and malicious processes, which
> is not the case for namespaces.  And because file layout remain the
> same, it's much easier to know what files we are dealing with.
>
> In a nutshell both are complementary, but if you're looking for security
> restrictions, you're looking for an access control system.
>
> >
> > Thanks again for your support and for the awesome project!
>
> Thanks!
>
> >
> > Kind regards,
> > Gerhard
> > ________________________________________
> > From: Micka=EBl Sala=FCn <mic@digikod.net>
> > Sent: Friday, January 16, 2026 15:34
> > To: Gerhard de Clercq <gerharddeclercq@outlook.com>
> > Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
> > Subject: Re: Landlock for sandboxing containers
> >
> > On Thu, Jan 15, 2026 at 09:39:49PM +0000, Gerhard de Clercq wrote:
> > > Good day,
> >
> > Hi!
> >
> > >
> > > I am investigating the feasibility of integrating Landlock into a con=
tainer sandboxing utility that I am developing (https://github.com/Gerhardd=
c/litterbox). Essentially Litterbox just makes it easier to setup sandboxed=
 containers for use as reproducible development environments. The idea here=
 is to shield a host system from anything malicious that might show up insi=
de a development environment.
> > >
> > > Since Litterbox is built on Podman, my original plan was to use it's =
built-in support for SELinux policies in conjunction with Udica for policy =
generation. However, since learning about Landlock, it seems that it would =
be much easier to integrate and also more cross-platform (given that SELinu=
x support is rare amongst distros).
> > >
> > > After reading https://landlock.io/talks/2024-06-06_landlock-article.p=
df, Landlock seems very well suited for this purpose. The only thing I am s=
till struggling to wrap my head around is how Landlock integrates with moun=
t namespaces and the implication of that for containers. If I understand co=
rrectly, it is currently not possible to enter a mount namespace after ente=
ring a sandbox.
> >
> > If the sandboxed process has the required capabilities (see setns(2)),
> > it should be allowed to enter an existing namespace, but not to create
> > new mounts.  Of course, such capabilities should be dropped as soon as
> > they are not required.
> >
> >
> > > Hence, I would somehow enter the sandbox only after entering the cont=
ainer.
> >
> > This is indeed the best option: setup the namespaces/cgroups and then
> > sandbox with Landlock (and seccomp for a more complete isolation).
> >
> > > Is this understanding correct? If so, I suspect I would need to exten=
d Podman itself to do so properly since relying on code inside the containe=
r to enter the sandbox on startup seems like something that could easily be=
 attacked.
> >
> > I would suggest to first wrap the build command with a sandboxer tool
> > (Island or others, see https://landlock.io/integrations/) and make
> > Podman launch this wrapper (directly or through an init service).  That
> > would allow you to quickly iterate and validate that it works as
> > expected.  If this sandboxer tool and the related configuration cannot
> > be tampered from within the container, it should be good.
> >
> > A cleaner but more complex approach would be to patch Podman to do it
> > more generically and without a wrapper.
> >
> > >
> > > Any additional thoughts or suggestions on this endeavour would be gre=
atly appreciated!
> > >
> > > Kind regards,
> > > Gerhard de Clercq
> >
>
