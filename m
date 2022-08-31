Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2A346AC
	for <landlock@lists.linux.dev>; Wed, 31 Aug 2022 15:48:15 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 72so14812111pfx.9
        for <landlock@lists.linux.dev>; Wed, 31 Aug 2022 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=731iJbrq97bqF4oiO6mw2bIzzVKxi2sYUevL1OUme+U=;
        b=PaeZBS3wmy6cwz0+CpoA50+7SaV0DrAnUnx9SZIFGf4/9639Ler7ICCMGLmEwl62Q1
         KiW5fubi2zONNiki3eC1JR5YHztVrkguufSi4eDPU2NTwU+5iDAVBHgwkyOjSxUmBul6
         RfICkfCO1WATAw7dZ5uiuWfxgX0D71ETYUPc89VK4Vp/5lvU88uWX8FVI6IvfeLtI2Mo
         qSlnjE89eWpX+s0DzA/S/FGQf3IWEX6x7bo18tMXYCKn5Eqyill4Jed/EzquGykiVrKQ
         jzldSsi8LVam2AbS9OYlgvLVl6EM8pfHS1koX/QPhUzUTcBGjGT9HBIwVbyuzU93S8OG
         v41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=731iJbrq97bqF4oiO6mw2bIzzVKxi2sYUevL1OUme+U=;
        b=FGFPuADJL68qKCle9lN6YJEwXrfZvLvfMrtFluPRVXZzAsS7f7KPinIppwGLGI4XHG
         RyjlAFUwCmSuGHgO/2Eilu5F9O9WVIenHCZs8lP8DJMFnDN89FP9ZbTJgHxR7TKrCpBm
         aXG3LcCpxF968Hp3k3cOQ5iZ2p+cy6RQA53wymSLvfMty1FljJe7f5r1of5Ism0EOAiT
         Kj8TJMSvCqKKr88O+dsuO49nBCG+FWd+mSoONSB08i5MDk6Ri/va81AsgMGsam/wRJsq
         WE8rvj+cOMk167COj0Lv2FFfJg/QpKtvj3rDfPf322nnUFOanzYbtzcgfuisjbfA581l
         z8Og==
X-Gm-Message-State: ACgBeo3EYZmTFEukB3MKYug9BsNMtvxr1QUKlGIR63Wy0+SXNMl/qcd+
	/FLlejMO3Jd+u0o3A6tGOD0=
X-Google-Smtp-Source: AA6agR6dnUJOGtfbLBj02XzxKOpC6uDfZ9GpmNK7TznK2i34GVOGGPOlI49h3kHa1fV8vHCDyqMhvA==
X-Received: by 2002:aa7:8e4b:0:b0:535:da7c:c2d with SMTP id d11-20020aa78e4b000000b00535da7c0c2dmr26829875pfr.86.1661960894484;
        Wed, 31 Aug 2022 08:48:14 -0700 (PDT)
Received: from [192.168.1.180] ([50.39.237.102])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902784b00b00173164792aasm11837465pln.127.2022.08.31.08.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 08:48:13 -0700 (PDT)
Message-ID: <97130959-6f3e-b155-9acc-943025374cdf@gmail.com>
Date: Wed, 31 Aug 2022 08:48:12 -0700
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: current landlock limitations and what it means for sandboxer
Content-Language: en-US
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
 Jeff Xu <jeffxu@chromium.org>, landlock@lists.linux.dev
Cc: Jorge Lucangeli Obes <jorgelo@chromium.org>, why2jjj.linux@gmail.com
References: <CABi2SkXXshnGiV7Tm3C-kvRn5+z26LPFdrmjT=GT39QmHSbHEw@mail.gmail.com>
 <2801fc80-f946-4124-7b16-cb1095ab6b5f@digikod.net>
From: Jay Freyensee <why2jjj.linux@gmail.com>
In-Reply-To: <2801fc80-f946-4124-7b16-cb1095ab6b5f@digikod.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/31/22 6:31 AM, Mickaël Salaün wrote:
>
> On 31/08/2022 02:22, Jeff Xu wrote:
>> Hello, Mickaël
>
> Hello Jeff,
>
> Thanks for these interesting questions.
>
>>
>> I would like to dig into the limitation of landlock, to understand
>> more about the design approach of using landlock for sandboxing user
>> space applications.


This has spurred a long standing curiosity with meon landlock.  Can 
landlock quarrantine a bad-acting binary discovered during machine 
operation?  The way I've understood landlock is it can be used to 
restrict a set of unprivileged processes to sandboxes known on say, 
machine boot up.   But what if during normal operation an anti-malware 
program flags a suspect binary running on a system, but it isn't 100% 
sure that binary is malicious?  Could landlock "lock away" and sandbox 
the suspect-binary for analysis by an admin to determine that suspect 
binary is in fact malicious and should be deleted from the system?  And 
if the suspect binary is determined to be harmless can it be 
unsandboxed/put-back?


Thanks,

Jay


