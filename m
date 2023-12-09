Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A78748C
	for <landlock@lists.linux.dev>; Sat,  9 Dec 2023 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0Ke9F6A"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50bfd7be487so3352512e87.0
        for <landlock@lists.linux.dev>; Sat, 09 Dec 2023 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702123346; x=1702728146; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=664ZfFwpls6w0BU5VdrY7vD0OJOkmYsDUQT7KXSEpwg=;
        b=Z0Ke9F6AMSPvB48LHz98L6j68/+yzmINei2VCP836E9bftu/78lS6e+qsDtg3hk4o1
         rkiWanQnlVSMo4paJTiboo2BoFy0QZMOwnVzUcZ244zXR1pG1d9RDvNOEgVZW8u9tVVN
         Mg2aXVkHKqdOMv8u0rcYVHm3XsNZh2YYSDTM/3PU4WP5ov4tPok/BA4Nz+ly592ygJ87
         RLMRhDd8F8+5vTBI22efWi0XKUq6XEftk+CE9WbZ1Rr8ke7G/ZaHYNDdoR4d+22xHE+R
         gyNxdB1A36FFXVY/ZGugv/7v8TEzOJsdpLqT+7eZQwYBZi99T0VHpHmw5FJwuGbrU34M
         cikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702123346; x=1702728146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=664ZfFwpls6w0BU5VdrY7vD0OJOkmYsDUQT7KXSEpwg=;
        b=scca750+PKgweUgXorMKsn+bTIA/OtI2hj5oCPCj3y5N40IsAr4D6f3RZDh7yYtYpa
         g6fOFfSLaJO3oJqu7HOogYdSQrEj5FrPutj/LhgbQrlCRzdni6+0O2MVEmAPn7CY2TjF
         v3fSWdjkJ46iPxRv60V8AeCMSCklxyme3KjHiRMigf7oaHvsJCLWprzQLCZSR1UvulK9
         g/Ahb692Ev/Pi9/xD4Zj5B0cEuocmH+aiJe1/FTgywgG43Yf2Nq3JIaLuv4A3bcj/e+I
         Zk4SNp+ZO6KGz7Da6Febf6yXohUC5gCXOmyAB+8xVSWel9EuGK/LKikqVuA5tZz5qnZ4
         /c6g==
X-Gm-Message-State: AOJu0Yzb8gFMTe5bkd4w4H6K6QKjlZbixlE8OvYViUXXnN+1xrB/UERH
	AOy7HlPZ5+UTNCjx+QheFB5ZCMGvzG5oAoF89oo=
X-Google-Smtp-Source: AGHT+IGjYoyyF+KwRgDED0u1/dvDSXQPSnMitL/WXEqsnsD0VRqpGyfrOlDzDUjzj5tdd8DwkjraKMoM0uYmQEmpyH4=
X-Received: by 2002:a05:6512:2399:b0:50b:f161:3c19 with SMTP id
 c25-20020a056512239900b0050bf1613c19mr800299lfv.85.1702123345582; Sat, 09 Dec
 2023 04:02:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK9RveLxro4zUG4jfFB=UNgcv5gdc8JuzNhMt=YbNhH=35ADzg@mail.gmail.com>
 <20231205.2bd704a93e21@gnoack.org>
In-Reply-To: <20231205.2bd704a93e21@gnoack.org>
From: =?UTF-8?Q?Vin=C3=ADcius_dos_Santos_Oliveira?= <vini.ipsmaker@gmail.com>
Date: Sat, 9 Dec 2023 09:02:28 -0300
Message-ID: <CAK9RveL0=49ixcc30mmzGcC4scnW4ssXPsZuxNv77Tg+6kQReQ@mail.gmail.com>
Subject: Re: Landlock support landed into Emilua
To: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Cc: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 5 de dez. de 2023 =C3=A0s 03:09, G=C3=BCnther Noack
<gnoack3000@gmail.com> escreveu:
> Please do not hold back feedback if you run into any surprises or
> questions!

I'm just waiting for the ability to have more isolation so I can use
it in serious applications.

So far the API has been looking good, and I liked seeing Capsicum
plans in the roadmap.


--=20
Vin=C3=ADcius dos Santos Oliveira
https://vinipsmaker.github.io/
