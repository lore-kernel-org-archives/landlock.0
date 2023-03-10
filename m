Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAF5628
	for <landlock@lists.linux.dev>; Fri, 10 Mar 2023 00:31:32 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h11so3578497wrm.5
        for <landlock@lists.linux.dev>; Thu, 09 Mar 2023 16:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678408291;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzbKhPtr1p1lWP/AoJCZZtPg/On09iASiExc/oZdezU=;
        b=OpbWLcOmAifMP5PWS9sEtj+KKd8wvSbcD+pE+UOdmFigpvM5E4D/d0M9OA53Wn88zM
         8JhlXbUk4F5Yr9bMK8kHeeJwb65evcZQttm3nswsr78m80Hchsu7ta5pxjFoimEIVX71
         xGDQON/Wlj31MVmJEC6YlKGzaEB202n7I/FhWirqSQfU4CDhGmUcKXbtsVQz1IfVABYK
         oo/LOOxq5h/YXacYAJEZOnNELcRRq3fateq9BeLqSmdt3xl+W4zkzB5L+SmCZ5AIFrix
         qmnKvOLqHQNFTsv71vyc0yeAXsvVZD+ohJG1aLq15Ab3UCKyI8kdBzpnshOI71dGHrtJ
         +G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678408291;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzbKhPtr1p1lWP/AoJCZZtPg/On09iASiExc/oZdezU=;
        b=kLIYrT3N5KLclDSoaJ4um2AfAkZEKfvnADx6eOQ4axYxkHeLCPJUCEDYl13szURpaM
         9JNxXrXGSJeprTQWiAJat4Z300qAMro4tWOXgJPL9sqIZ6bdjLHAQszdY/ryQ87+IYOc
         6hNnuzYqb84XNgXIt7wDV+uK54XFL/ZRQkua+tqJ3n2cRl+Q2HDTBJZdpXo19DVz04wM
         5GhkAng53xv0T2n8MLySt36yMVClNbKx11fuWJiFMgvdHS43kT/kXfDubVzF70siYUtt
         ED8/SxdaAIojacDyUXB7bk/k/3SEpo4Pa5Zh8A/JeCY7r1JzIO1EJEm7kqC3kk/1Pfny
         f61g==
X-Gm-Message-State: AO0yUKVzsJ0xMQ7n9CheLMKu21jB18JMRBqNoap0KPEG0ViFuksTrq3Q
	OLvdVYQMA56v0eAPyZvS36M=
X-Google-Smtp-Source: AK7set9ni1+XJYH5uPzWMckwwsYMGAl9u4eSx7h5lvZZA2tak/oQhHMNGyaPR5+zfeGlvaE19R59kg==
X-Received: by 2002:a05:6000:1041:b0:2c7:604:52a1 with SMTP id c1-20020a056000104100b002c7060452a1mr15377755wrx.29.1678408290968;
        Thu, 09 Mar 2023 16:31:30 -0800 (PST)
Received: from [192.168.0.160] ([170.253.51.134])
        by smtp.gmail.com with ESMTPSA id f18-20020adffcd2000000b002cdbb26bb48sm658729wrs.33.2023.03.09.16.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 16:31:30 -0800 (PST)
Message-ID: <cb3d6b3e-0c9b-635e-380a-c79e36ae8ede@gmail.com>
Date: Fri, 10 Mar 2023 01:31:22 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] landlock.7: Document Landlock ABI v2 (file
 reparenting; Linux 5.19)
To: =?UTF-8?Q?G=c3=bcnther_Noack?= <gnoack3000@gmail.com>,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: linux-man@vger.kernel.org, landlock@lists.linux.dev
References: <20230304171607.8301-1-gnoack3000@gmail.com>
 <20230305.d639b17946bd@gnoack.org>
Content-Language: en-US
From: Alejandro Colomar <alx.manpages@gmail.com>
In-Reply-To: <20230305.d639b17946bd@gnoack.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tO0LBOzWLMNo2Gh6dKD9IMnt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tO0LBOzWLMNo2Gh6dKD9IMnt
Content-Type: multipart/mixed; boundary="------------4sGzgClqbjQsLYshcTH93BpN";
 protected-headers="v1"
From: Alejandro Colomar <alx.manpages@gmail.com>
To: =?UTF-8?Q?G=c3=bcnther_Noack?= <gnoack3000@gmail.com>,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: linux-man@vger.kernel.org, landlock@lists.linux.dev
Message-ID: <cb3d6b3e-0c9b-635e-380a-c79e36ae8ede@gmail.com>
Subject: Re: [PATCH v3 1/2] landlock.7: Document Landlock ABI v2 (file
 reparenting; Linux 5.19)
References: <20230304171607.8301-1-gnoack3000@gmail.com>
 <20230305.d639b17946bd@gnoack.org>
In-Reply-To: <20230305.d639b17946bd@gnoack.org>

--------------4sGzgClqbjQsLYshcTH93BpN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello G=C3=BCnther!

On 3/5/23 11:24, G=C3=BCnther Noack wrote:
> +landlock mailing list (feeback welcome)
>=20
> Hello!
>=20
> On Sat, Mar 04, 2023 at 06:16:06PM +0100, G=C3=BCnther Noack wrote:
>> * Add LANDLOCK_ACCESS_FS_REFER to the code example.
>=20
> To follow up on the discussion on the man page update v1 [1] -- let me
> make a constructive proposal for a simpler code example for "best
> effort" fallback in the man page.
>=20
> I feel that implementing the full generic "best effort" fallback logic
> would complicate the example too much:
>=20
>  (a) examples that try to demonstrate too many things at once
>      tend to become confusing to the reader
>  (b) there are readers to whom the full example might not matter:
>      - readers who know what kernel their software runs on
>      - readers in the future or on cutting-edge distributions
>        who can assume that their kernel is likely to be fresh enough

I prefer if examples assume latest and greatest kernel.

Examples of how to support old kernels would be good in complete
tutorials, but over-complicate a short example.

Cheers,

Alex

--=20
<http://www.alejandro-colomar.es/>
GPG key fingerprint: A9348594CE31283A826FBDD8D57633D441E25BB5

--------------4sGzgClqbjQsLYshcTH93BpN--

--------------tO0LBOzWLMNo2Gh6dKD9IMnt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmQKeloACgkQnowa+77/
2zI/Xw//cubqRonWvPq+y0nFqjlJ5HsV25cggfurLCUvIPxeGJuoBHy23xOpuh8s
u6KOmX14mrc6uilqiU2T98xJQoEfI4QyPo4HAEPeEr8KPd9ZqjKfAv774kjJQhTJ
3OMy9O6DAID0V1+BpkmoywjA0KnNKvxv+DuBrR+AegY59sJ7cfVavH370O0vKXZP
9z0kUHBgB2iE3QrFllWr4qqm7Bx2gFAFLAbrxbZp4IPxjtbZUq0+NWs3GElGhIRf
0SsFLL5PqWR+Yp3KR7EHkqLA7dbLoK3sPtnBEge1PLSj/SRVOXYGpCzdfTGAX7ll
/5dGllLjcp16xnjvHJvbke8vsb84y17WP2K24qq7KbMOOQ2qGI8PoAdRbpgi5xzr
qm3J1tK0wSy0I1EE1Bhttebv9Dke3lgtJZ0b/1EUv8gsweXaKUB0YtiQLMYPFDoG
Q5yFH4gmJRZk0Q3zoOlcJGztC5PjG2iKm8wiX37BjsCYw+AFJrgspuka0fqyDALR
jJ3mfqScK4if1JY9vfajFFgiuyG7kxbYQk+bi1P33c+OACeaLXmIlyoa6am/08j9
iYAfUzgoSaVXYgNtmXZHvsrLvWwGWuw641JbgablXuO3Vfb+dLjr1rhiVM8InwLk
vdRT3cKC1Esw2/37UIGWxMLBvc7A0aDUDJoJNeuoFn1oPE2ZDZk=
=5JSx
-----END PGP SIGNATURE-----

--------------tO0LBOzWLMNo2Gh6dKD9IMnt--
