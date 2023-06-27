Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD619BDF
	for <landlock@lists.linux.dev>; Tue, 27 Jun 2023 16:14:44 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so1622011b3a.0
        for <landlock@lists.linux.dev>; Tue, 27 Jun 2023 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687882484; x=1690474484;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6WnFLX6p7LWYlsVpAeHLXWRKM18zOLvNi4cSmub9L8=;
        b=SQ1R98KqaOirT+L42CwOYBghYpwBZkPfKCzUwOry03k/5iQ+yBVSSo0ZTuLQjw7T3+
         VgaF5irlF53E678xCYoSAG/l1DlB00Cw7dw9x/lSuUEN1AQt3TKuyq6UdfBgYt9rUt5y
         PdWMcvlLU3Dz2FrpwGSWnxF7Y35UKZSyOu1tPJiY5SRUpsLHLmZZHw9e3HqeBh+b9Fac
         xUwh8eOZgMRRa8RMfVBD4CKHFe/sj1m7nE6IDQrk1LXGWNNg8mXOIo31M8CLxUGQkqLG
         V7CGJANkXWZbmfbAp+I92cVkq9r6GgntUkWd3OBTP4CMSgGcAgwSIzaQtKD7MWg6C4Ie
         hKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687882484; x=1690474484;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6WnFLX6p7LWYlsVpAeHLXWRKM18zOLvNi4cSmub9L8=;
        b=E6ICj5P8AxhL7gVONo8mJn6rZ8dFRf7lROr1zqKMMgibhA/nGe+bMzGDQPQn7OkxmW
         GvGzkMBV00Vf9ufMvcli0dcu+G6LYqqjQj5qMOeqKhN+HxByuavvTVjlb08v4NYViSeo
         qUR5T5suikf0HCOcSDjUvprhiJRE39tJuZ9dF7DAUlc4xrtqRKirhEL9kB5xYX4UInOh
         PGzB9nbY5MQeqWHNSKQCbAq3p7fRjAqQOOiIXlfXW8n+TAM0D7pNx1ZHnimy1OKOkkZ2
         r5Edn1fvqFBDtRqOiNJN3VMA5fdoPkHxYkt9M+qzO/yKjfI4y2vlNMAP8p82YO8fWkU2
         88BA==
X-Gm-Message-State: AC+VfDxhfbSqmcPY5aZdKR1h3e5HzmkzyDbDdy3PmPQ2mZkpuqh5GAdB
	k2Pygea8cIvA8k+G6PaACTZfZOx+xoQ=
X-Google-Smtp-Source: ACHHUZ5X+EEWJGC6rA1V2rlrZxUdB4gUAlO/OBbNNycrnS6Hf5YVs4MnlSTloydCZla+EEXmGgnyQw==
X-Received: by 2002:a05:6a21:7885:b0:129:c38e:cdd7 with SMTP id bf5-20020a056a21788500b00129c38ecdd7mr3856911pzc.38.1687882483665;
        Tue, 27 Jun 2023 09:14:43 -0700 (PDT)
Received: from [192.168.1.180] ([50.46.170.246])
        by smtp.gmail.com with ESMTPSA id jw21-20020a170903279500b001b80ed7b66fsm3100796plb.94.2023.06.27.09.14.42
        for <landlock@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:14:43 -0700 (PDT)
Message-ID: <480a4459-dcfe-e5ce-bce8-6fc59cb89b9e@gmail.com>
Date: Tue, 27 Jun 2023 09:14:42 -0700
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: landlock@lists.linux.dev
Content-Language: en-US
From: Jay Freyensee <why2jjj.linux@gmail.com>
Subject: self protect process with landlock to getting killed
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi I had a question for someone. Is there a way to protect a landlocked 
process from being killed by a non-landlock process?  Does that 
protection include root protection and root not being able to kill that 
landlocked process?

What about is there a way to protect the directory the landlock process 
sits in from being tampered/written-to by a non-landlock process?

I came up with the question from reading this comment in the kernel docs:

"Once a thread is landlocked, there is no way to remove its security 
policy; only adding more restrictions is allowed."

I believe you can get this protection through SELinux I was just curious 
if the landlocked gave you that as well; SELinux can be confusing to 
work with.


Thank you,

Jay

