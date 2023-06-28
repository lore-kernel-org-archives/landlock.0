Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509AC2D9
	for <landlock@lists.linux.dev>; Wed, 28 Jun 2023 15:21:00 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b80b3431d2so84315ad.1
        for <landlock@lists.linux.dev>; Wed, 28 Jun 2023 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687965660; x=1690557660;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uipbLliP+qXOyVyt3+YYbav3BSMc4u1+fHDEGeHaxJ0=;
        b=anY8y3KlPgA/Mu919woFGYD9N2wxyEb1rl17hKU77oEbeMAuXxf6hm6M27Fn26iMsm
         osC2s4GkskHnEhZJSrtyt8ietsM4M+yZ4NBSnT6A6ClZ9sV0WR4u05Zb5SDemxUczhr1
         irbOIhibsWZWi8fx6YhOUMT0PrTtr4J2nvlzmEbr445ABiPxQNBTFGBxSuav5azt+/iU
         I1vLpYeGF2twbG/xWcMFWihwaOWsn5FSOJHz73CVl/4KSdlW6QtQ/SxGyx78iKu+6kI8
         JxB56ymnSF2QRapwzSdRolEmbT+9xu7XGhvC4ZLl5HojY3AlMjQVJo1q27RriIQcjW6L
         j3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687965660; x=1690557660;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uipbLliP+qXOyVyt3+YYbav3BSMc4u1+fHDEGeHaxJ0=;
        b=bzsjNg5PD9ipT6jjJPCOyie1WvUJHSArZTBLDWxXm0aUwHhIkZIqYkASPbMsnGbesG
         rSw73CISqXaZJR+8xmx+5hfXPogGDs4e5esxhE3XIebPGw0DQxR/eC9FMUrcVyS3GdMb
         pYrQpJ02HDkVCnsjLvGlL9AQsES4e34QFS6vGExqGi/HP81w8wbAxQwlJmtU0AUPhEIS
         ftx6L5/SWOHd8P/34R4U3DeV2ME6oy2AxO+2FqhtdaTGNjv97Ri9HLiyRWlNVdS4YT9S
         5arenWds1Gm2P90LOZuubD1JJayKu8PXrSftXvxLZvXK9LcK9ECrqEZzeJCwbqX/hYxj
         Mfmg==
X-Gm-Message-State: AC+VfDwnSNyo1Iw/SebYrd1BqYR1mlk2MS9x1Mo6cgDHMnPq4gZItN2b
	18W4u8vburdlsKpqPfdWLLGIGkL2WE8=
X-Google-Smtp-Source: ACHHUZ7IoevSaC+khQHER82H7hHdKvj1NJptxKWl2Q+KfYhOo8A9dHIGt9peeh+v6B3EjX9gk3/8xA==
X-Received: by 2002:a17:902:e883:b0:1b6:8b5b:4dd7 with SMTP id w3-20020a170902e88300b001b68b5b4dd7mr10209362plg.38.1687965660149;
        Wed, 28 Jun 2023 08:21:00 -0700 (PDT)
Received: from [192.168.1.180] ([50.46.170.246])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001a69dfd918dsm2543390plb.187.2023.06.28.08.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 08:20:59 -0700 (PDT)
Message-ID: <efc094bd-97b3-62fb-09d0-1082b51bfc20@gmail.com>
Date: Wed, 28 Jun 2023 08:20:58 -0700
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: self protect process with landlock to getting killed
Content-Language: en-US
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
 landlock@lists.linux.dev
References: <480a4459-dcfe-e5ce-bce8-6fc59cb89b9e@gmail.com>
 <f2a1ac61-fc93-50d2-cccd-9485ada0b047@digikod.net>
From: Jay Freyensee <why2jjj.linux@gmail.com>
In-Reply-To: <f2a1ac61-fc93-50d2-cccd-9485ada0b047@digikod.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



>
>>
>> What about is there a way to protect the directory the landlock process
>> sits in from being tampered/written-to by a non-landlock process?
>
> The same principle applies: this is not possible with Landlock itself. 
> The potential malicious processes should be sandboxed.
>
>
Thanks for the response Mickael.  In this case, this would kind of be 
like a zero-day use case, that we wouldn't know all the malicious 
processes tampering with that process's directory up-front, we just know 
that we wouldn't want any non-landlocked process (known and unknown) 
tampering with the directory the landlocked process sits in.

Thanks,

Jay


