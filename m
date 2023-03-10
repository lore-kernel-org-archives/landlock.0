Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD7DABB
	for <landlock@lists.linux.dev>; Fri, 10 Mar 2023 21:31:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so4353028wmq.1
        for <landlock@lists.linux.dev>; Fri, 10 Mar 2023 13:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678483880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KSBkH3+D9W+G9TS2OMqOTXcMDQkKRw2iNv8LxDcGHt4=;
        b=QqzU3/kQRA5ts16Kbv5N9Oi4cQ9hB24ps0PTme1G3HXN0Inn1ZYrf7at4ZW4Oq8TWe
         +En4qEObeMa9J0dLCSEbxdzbFrekJJ+ZLk37B9Yzn8bt8TtyCFx0KJ3UfK/8IIhrs5mv
         Qb8qzDVHmtg8UidEP0DlQ+yknpdlXSmG3JM8n5QUhLyUlpROKxx4QZ7h50Zg9nNiaNj8
         yPf4lGpVrmrECKJ59bmlCcuGzpWeLDowUirK49ei2aS/6NACAc7zOyQqxygaSPfDccHH
         Sd8gGXoivXm6BW5UsHfRXohCYqLTnizjW2z+GYu69N2Eqg5r0kZZ/8TUL9mWJvaDUOWj
         hpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678483880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSBkH3+D9W+G9TS2OMqOTXcMDQkKRw2iNv8LxDcGHt4=;
        b=Fnc3h+Pgre3uS9JgG5TdV2otp6FlBC2eLRPik4tCIBeOdIcuVs5RA7ewJjqrIEltqV
         FdVofhA8IymPO5Bc6t0zCNSguKMFR4C1Rp4wmIyLH9H93AxK6tan1fsbAutfbCRzarFG
         U4JwSXEiwrYFI7fzB3L2NsubWj0QfvKEDhkhGt4A69g282Mb6PNjutgp06Cm3AkXkKrD
         i7jwml1NJlArSMAgct/lc9+jiMyFhP1WQXovZ4AB4wOSrvNPwKmA8+Ack7dsKM3poXi1
         WrWr/DejzlQ/pnRC97e0NK/w+YxkQ5jSlcyseBr1HZtxi+9RH2EX77pCJCw2RyR5PHBO
         K70Q==
X-Gm-Message-State: AO0yUKU1SYJo3TBGhX6GHNg0zfxBdfJPQIcU+3PnrAgYcyuPGF6eTHU8
	g7Uf63gSVVCaN2S9WmZl19o=
X-Google-Smtp-Source: AK7set+u+ee72E8xENAK7Gf1SK6rYaqQFIwSF5KGN7T0dSym+DtNCKGkH/b6sin+DGNNaYrTZUp78Q==
X-Received: by 2002:a05:600c:34d5:b0:3ea:f882:bb3d with SMTP id d21-20020a05600c34d500b003eaf882bb3dmr4077171wmq.4.1678483880733;
        Fri, 10 Mar 2023 13:31:20 -0800 (PST)
Received: from localhost ([2a02:168:633b:1:7c09:9c3b:256e:8ba1])
        by smtp.gmail.com with ESMTPSA id s6-20020a7bc386000000b003db06224953sm942195wmj.41.2023.03.10.13.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:31:20 -0800 (PST)
Date: Fri, 10 Mar 2023 22:31:19 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx.manpages@gmail.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org, landlock@lists.linux.dev
Subject: Re: [PATCH v3 1/2] landlock.7: Document Landlock ABI v2 (file
 reparenting; Linux 5.19)
Message-ID: <20230310.3c71a20ff2de@gnoack.org>
References: <20230304171607.8301-1-gnoack3000@gmail.com>
 <20230305.d639b17946bd@gnoack.org>
 <cb3d6b3e-0c9b-635e-380a-c79e36ae8ede@gmail.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb3d6b3e-0c9b-635e-380a-c79e36ae8ede@gmail.com>

Hello Alex!

On Fri, Mar 10, 2023 at 01:31:22AM +0100, Alejandro Colomar wrote:
> On 3/5/23 11:24, Günther Noack wrote:
> > I feel that implementing the full generic "best effort" fallback logic
> > would complicate the example too much:
> >
> >  [...]
> 
> I prefer if examples assume latest and greatest kernel.
> 
> Examples of how to support old kernels would be good in complete
> tutorials, but over-complicate a short example.

Thank you for the review!

Fair enough, let's use the variant then where we just assume the
newest kernel -- that is the code which we already have right now, in
fact. I'll add a small remark to point out the place where people
might want to handle the backwards compatibility with older kernels.

–-Günther
