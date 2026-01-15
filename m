Received: from GVZP280CU018.outbound.protection.outlook.com (mail-swedencentralazolkn19012068.outbound.protection.outlook.com [52.103.35.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF65F322A15
	for <landlock@lists.linux.dev>; Thu, 15 Jan 2026 21:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513194; cv=fail; b=KnVuDxBlggaafC1IyNwIoCoRmPuY5NIBS3zaZywn6D8Tzyar9OiBMaQVKmztCjRtf8BfXHCZsxQJsixGwML56mfRE4ksEZCQS772s+zG/cMqzklsPvnVin4c92ktpMei42/77OixJU/kNr8uQKJRxTAqnr36SLWUOF/oNXikdK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513194; c=relaxed/simple;
	bh=ElNqLmUqq2TD6EQAbENxnEgwTW73/e2p9BN9pihO1xw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CHXMmGG3KnKeWgQKotFraJCbu1JjLWfgdK4Fd6WINrSagZUc24M4IxSk+Up7naR0gSorlM4eMMX4W8/pqibHg+hawJdFVyeg9CvKzutAbOYb2SOFEIjfZziQ8IMZRTq3IGcnX75Zxho9OodBOJbz3oqA50MDvIAVZmMSp739JRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=urb5JNQb; arc=fail smtp.client-ip=52.103.35.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="urb5JNQb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baYzufz4V5DjAJ+VdNs7eytMA/DAlQ4/R3b/0+B2kzswJZslbySVHyQcnfVRUb0DRb+p03E+RqrTQgfdThoQEdAD8rOw7WIL1spGkE8Azvpc9gy6ePPlhFIQ8U+5JpJWlTN2CXvkc7Ge8WiuP/r3MlHAFtA+oVragnxW9zwowXr5DuJ+trHTwBDKWDnBmgdrAXDZXpfMvGRrmJ9oiY1vy65rKGR/fszhwjFO5nQweWxiniGgt06f2T/CmtPq/rfQImJI8Z0o2r4Fs8Xkeo8YfO5dZ0I2hDSN8H5/FJ4p/y4Q4ENpZUpePKmoAv+yuDMxSFXdPE4UeS8JlYntExDa0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElNqLmUqq2TD6EQAbENxnEgwTW73/e2p9BN9pihO1xw=;
 b=OHyVUje27nXcSiZoFeAZ72cJqyduQVQidkuxf1SL2Sl6f0s6JFLSvAFpyO756fx499x2xvAox27FpI3rI4oiKeSaUGxiZyUYlCJEE+1IBD7dXMeBvG0Hh+2s9y/SIEd04+kUjxqZ6wUbe7UBqWCT264Lw/kZ7qDIJpkoGhG+CBHfFZSK0JhHYlpyuCO8lzr2AcRrhhf8pDG55I14tyMiBAG4iScmauNj2Nf909FNNFTVHAcwAsTv6JjkBBUBoqwn06AzMmDQQYoXHC2wKZgzCDkaFDvGjdWRBplQDFxIomuGyUcZqgY3CCVePPWusKrIrtAS63mVqWQeFh/gGar1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElNqLmUqq2TD6EQAbENxnEgwTW73/e2p9BN9pihO1xw=;
 b=urb5JNQbVJkvQs9F2bn3q8nb2X09PSOlG0BcNm9dEoKBlMRJYuLnha66pB9eUK5iXm78hbntytNhMM2UvfNtm7CNZJzL7OkcsE5ll6m68LL643xqWp2vsJCoAOmaUb94iIJo3x0lAsMzK6RXgaUB/txr48atzXxR/N4NSqtgzvsksajej8/HWcVDAKOGebgq0DbH8WbyeTz8T5djyow5LqZ46Qv/YXGEIOfFhCQzFBV90aN/iBLlOnlx2oXPJ1RhIh7G8fOoDhVlbPDbl665jDgXp8GCgHEaNZQ15FpXUMuVpdAEHmsS5UteC9MT1pRZSrtuYiwy8d3fkB8NC9T5sA==
Received: from MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:1::13) by
 GVYP280MB0816.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:eb::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Thu, 15 Jan 2026 21:39:50 +0000
Received: from MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8a32:ef8a:8be8:f315]) by MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8a32:ef8a:8be8:f315%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:39:50 +0000
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject: Landlock for sandboxing containers
Thread-Topic: Landlock for sandboxing containers
Thread-Index: AQHchmcrKmIH5n3i4UqE7UAOc5D+Dg==
Date: Thu, 15 Jan 2026 21:39:49 +0000
Message-ID:
 <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: en-US, en-ZA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MM0P280MB0897:EE_|GVYP280MB0816:EE_
x-ms-office365-filtering-correlation-id: 0dadcc23-2209-4d26-ece6-08de547e9c5d
x-ms-exchange-slblob-mailprops:
 cMYiyfCW+t47Rh5u2KvI1CPTOnmzfxX/Kk2uxtREEivJKXNFnj6RYJnPqpPPJlWB3u9O5FEyURTuUym+LEP7YGBfuQ3i83sPa9yR4ccZORrV/irday38iXZKswq78DnjwYeH1suigp8oQXCEbcDhirACcihlGITZflBC2kLTvQCPg3QOQPTzPgikyASKYwvvkIbjJSeKCOEJma8pZnHmBBaEwEImQmLxpXzryG+CLqO5KRHT1ftmq8NiDcPJ8Dmqv1tseY3s36rvk7wJIOmn8Jz8UoJ91omRVIJpzMlCHwpvEaZSEqJ9lbHnWst4KylzGDv9NwyB7CuTceRoI2UxstI6kxspHXrh7mWiqasAUMBntGC0R9ylKataGaD80Z/vauD3KrRL+Ue7J24bhrULlZPUi+MWYJByEuRvXyuU7gQI/vL14RN6ahWSw0fj6weavsk9kfzDW7YtBclVD1m3oo9uiu9Tua9nQe79PW51XhtZGs4W/ASr/PYwWjps3F3319GF0QBrkHewhNuubpYm/FBwVV2ZexS4+7DxQIynpb1gNQUyjPSBGpTY2O3yO86GlYRyLJ95Rd/wnvg4ehsYpgpHFheQ+mjCUC1X5Bz9h7Er9kHh5VEeTsAtK+Q/Lf2TSdckYO5OGbKLQZdGUrOEIGmrW5pVjOt7u/S72eHFpmoZ7ntF7hJSs7JpbqRYOxTTl471Mn2SXX7IfRtyXl8998nJuk87WGSI5/w88gVuXsKVQQphSkJPGeEH3+eNMpCQttWnii3TlFzRoW9rjfbRIA==
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799012|15030799006|19110799012|8060799015|51005399006|8062599012|31061999003|3412199025|4302099013|440099028|40105399003|10035399007|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?2kU8zHkYMrG3NOC96snVVyiYMYBGcYjQqFQGmVB8BS3S9ifLUUtiU1Byvq?=
 =?iso-8859-1?Q?U/yXpNFHO6XNlo/nEzzk5bV8D2J2E5MFQhV0YxP6Pou7tzzCK08n39l8QE?=
 =?iso-8859-1?Q?tljatgd7W1trkT/c9Gd/nAwi/hoyVxFnffyoUjUY993wRfjtXOLEi31i0d?=
 =?iso-8859-1?Q?XcvgbhLGJRkjt5pJ5Q0KpRy1Y1RYvRAvzn2ualKLQLqB7BXZ6mD0QQpnsV?=
 =?iso-8859-1?Q?Cs6K2VyKpZKVWYcjPcE/VpdiE1dVjldQIO3FxiMLk6xiAJeQmVhYnNEmJa?=
 =?iso-8859-1?Q?Y12dtQXVS13wI7mw57NriI/guozSzvsHeYdfMiFTvECGRKVNWNoE57HR3X?=
 =?iso-8859-1?Q?gI4nEzyO1Nir/Gg+n+v5wioSEtKarhWs54J5mVh/DFViOWrqcA3Hj/c9Xv?=
 =?iso-8859-1?Q?5dQadhahXUFHw6C1UxfbHrdI/2t96rAZsK8GzS8EX3dZYHz7EsrP93usM1?=
 =?iso-8859-1?Q?+dt6dnEbAYsJg0C/W45hHw7YStGOBxRTwc0GWTJ1hVLm7KLQxB8y8WNJmE?=
 =?iso-8859-1?Q?pZDTTvNht58mmEwnTqfawx2Ijm+1gtjkedny23EeMn5SL++yN++PtIyfLQ?=
 =?iso-8859-1?Q?JI5Hne2n8TiXknY6Ik6IKPY/Um+xEY24baleJWoChgKFCFn1jEDpc3iGnW?=
 =?iso-8859-1?Q?s3XVBfDV990IiL9GR/LeYyNlHFxrvCkx+P5iFXgsCcCX9B0tG9dVjS+yDN?=
 =?iso-8859-1?Q?TEtdeZnJ7mhxF4Es7H1Nj47bb3HwSmREIz4BISeYfciHKMSU5+7u8Pkuc9?=
 =?iso-8859-1?Q?1Rr3HP0dk8yufIbLNTb9MPIWoH9VNyaaL/jsbudratwz6n201UEvZ6PbWI?=
 =?iso-8859-1?Q?Evn9DnczMFL50ACcxtUBbkPVtBGDxCaaFhsJkgQjIouvmMfe3n3x52iIuR?=
 =?iso-8859-1?Q?BZYwurCo58Qz+rQDEmIAJWKtt4cVBrsUoFseo2DiF+I4rSM2gGePZnkrtH?=
 =?iso-8859-1?Q?XfpvSYmyrtYNldTN53zeNpuoI9oK4i33wMAB9vjAxYVa4UYuQxrvTR4abU?=
 =?iso-8859-1?Q?gN4ShwXCWBP79a1ya0Ct9AokejXop8W+Tbl7PRG/TSid4VD9NSG8rRJLrK?=
 =?iso-8859-1?Q?SbQBhH5DscXBOz/ICmTp0CPH236196L9ItIAVTMWiK4/EKz6SIy93wkxZt?=
 =?iso-8859-1?Q?SKQGW2/E+96NVfUjyFTobtaPPQtTL37OrAneLeFubgH3HZpmUay/Qb0gMz?=
 =?iso-8859-1?Q?lG8y7CdLwsgwUtcBcQXOb1UvozXeDB+UPB8jvONnTN+U5IXDVwWqesHcmI?=
 =?iso-8859-1?Q?cuQuzCrtwFZgqrIBLpDZ2z3N56Kp2dSj/tTmFsfNWw4n88HpoN+Hf90M7W?=
 =?iso-8859-1?Q?oeqmQPdYQTsQ37CWTXnoAxACDLNB4FDYIbOcLLm57j2uxSU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?izRHd4247rKI4sNhWyVoOi1x1MZUKJcgT0wYt7A9nWNVacP3He4jcqJ2GO?=
 =?iso-8859-1?Q?bECxv5vo4OWCZv1KpG9rNS9FlIxwfOzv/ZcZZYgTyzl11usjdxcvP4jmAD?=
 =?iso-8859-1?Q?dZYuplnenKhoXnbMt6wKcDHHv9tBCQaaI1gaXnfyLVkFLPTgb9sIcMsRG8?=
 =?iso-8859-1?Q?42+sG/HRFcQgxz8epbFcdOSZROrJiz7MfNo8ATSWbpTAbuc7xEmN4nchqC?=
 =?iso-8859-1?Q?YVVAkqTy/1DX8w6wgslqdgHkt+c/yz4C7bNHXr2jjfEx/QwHXR3CcaAodE?=
 =?iso-8859-1?Q?fGX/uBv58Vdmo+1mGbCgMC5QDsUgEPLlNpoQdCRzJkkJ6UiYKqxeKh3hCF?=
 =?iso-8859-1?Q?eOifrmuHonjGXnn34qGI0WgVi6nLAf52fHy/gAQZeYt6Uw8NbFb0V+XqQW?=
 =?iso-8859-1?Q?YDDRduLF9RBJMviKFC31B+XHifUGU+erpeza3YtYfvVxC+cTbSJkuYGrnW?=
 =?iso-8859-1?Q?U/ozivNJDntUPo5D7VbMOiRvf65RVcz4p1foFVtjLQC3FFdUrCxj1tNfwK?=
 =?iso-8859-1?Q?lhvd7kJI7/A2VeWZArmPBkqrUyIBDsCHOIAGvFNbU+wMLkSvT/1Ok/UVRX?=
 =?iso-8859-1?Q?LbuLwpyug7uYgoagbtFELWXxgET2TmbN/UhEdfliz8fGASmDMAi7JNuym6?=
 =?iso-8859-1?Q?h8KbCjEC9DQrWGlx/KuzaJNzxNRrqnkgWOFTzMGoobF6IS/fJFADGv9z7L?=
 =?iso-8859-1?Q?ELmMNCcxyz5fffGc8exsCy5SONRKdFDEgx/XJSXAHUpD8K1wDiu9F6uplY?=
 =?iso-8859-1?Q?kt0GULdqrRfUZd/Il3xe2C47zMLdd099H6jdgLR+HGapMWQ4pTVsgBhesh?=
 =?iso-8859-1?Q?J5luD945XOGarl7e6kEAqX1fsCt5wwnzBbKvrMynltXk0+7T17w41/+v+P?=
 =?iso-8859-1?Q?kVSqRQpqLqPCu9b2wStkUR0Y+3+BEKo1kC1gT6RVU5/uLXUDhJAYQGATwo?=
 =?iso-8859-1?Q?MMyGJGJLw9K7UbHf6HKZ/DCTtvFR+2SIkJp1OQhfKPS1W8tQ1w9y1Zb0yE?=
 =?iso-8859-1?Q?diyuDakw4OS4ndqvZeTSJ5GZ6AYUtY0uYgVwAGOIxlHzSCVsRuvSFRZkx+?=
 =?iso-8859-1?Q?AuiOEl8EFuOpj2Ol76ZfuwlbmIGeKmN6yU5Q7+mkMNVWpfg1oQzR9qeIGP?=
 =?iso-8859-1?Q?hwgsfLGQQNTOWfSkJg55DFr27b+zTTPWqTLUDjLF8MsrTvWiTzQ+/4aVWB?=
 =?iso-8859-1?Q?mJUv6RAvGiI/QfJh9wy0tzhH7YyCnMtVW1aDqvdp7fUTKLDQniFQs598FF?=
 =?iso-8859-1?Q?YdBRtZSm9SGzqvVVT+BXk+fxh+x+RJ0EJOnHh5Mvyezm7HwCGi6uBE8dW3?=
 =?iso-8859-1?Q?8yiDZoCcSrGBtd4PUw8iJUHP2iHwxPkrrIpoJ7SjREiPEVQ87VCeDql/1y?=
 =?iso-8859-1?Q?fI7d6CmYnyyJOCY7PiUIU7YPYnJR1VpdraxdtjFp6OEV37NOJ4bxoUFpQB?=
 =?iso-8859-1?Q?Q5by9Tw3LxJFlw4+?=
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
X-MS-Exchange-CrossTenant-AuthSource: MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dadcc23-2209-4d26-ece6-08de547e9c5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 21:39:49.8504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVYP280MB0816

Good day,=0A=
=0A=
I am investigating the feasibility of integrating Landlock into a container=
 sandboxing utility that I am developing (https://github.com/Gerharddc/litt=
erbox). Essentially Litterbox just makes it easier to setup sandboxed conta=
iners for use as reproducible development environments. The idea here is to=
 shield a host system from anything malicious that might show up inside a d=
evelopment environment.=0A=
=0A=
Since Litterbox is built on Podman, my original plan was to use it's built-=
in support for SELinux policies in conjunction with Udica for policy genera=
tion. However, since learning about Landlock, it seems that it would be muc=
h easier to integrate and also more cross-platform (given that SELinux supp=
ort is rare amongst distros). =A0=0A=
=0A=
After reading https://landlock.io/talks/2024-06-06_landlock-article.pdf, La=
ndlock seems very well suited for this purpose. The only thing I am still s=
truggling to wrap my head around is how Landlock integrates with mount name=
spaces and the implication of that for containers. If I understand correctl=
y, it is currently not possible to enter a mount namespace after entering a=
 sandbox. Hence, I would somehow enter the sandbox only after entering the =
container. Is this understanding correct? If so, I suspect I would need to =
extend Podman itself to do so properly since relying on code inside the con=
tainer to enter the sandbox on startup seems like something that could easi=
ly be attacked.=0A=
=0A=
Any additional thoughts or suggestions on this endeavour would be greatly a=
ppreciated!=0A=
=0A=
Kind regards,=0A=
Gerhard de Clercq=
