Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4FE1FFC59
	for <landlock@lists.linux.dev>; Wed, 15 Jul 2026 08:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104780; cv=none; b=f3ViI+rxtmx1miYo0c48jn/D6EZ2RqWfxEXDqJ/QNmIwpC6MskO2Is2q0X/48wjs2wfAJa4gBY4Cy1A/wo+uIlHbwXyYUM2OdSX2kLlgqyvHu0H4kbrMRIj93y9LQYzXWV6uWu+ZkHuOE+eT6wQ2huPmk0Ho3QLCFIoXT+XpI+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104780; c=relaxed/simple;
	bh=cEm/qTnAzZOqSTvTREY+WKNkOF2thKgKBFQSaQ9uI4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhgFLIJF9Z7vrWR4E2ibh0bK0+PKK8f5yjdFvnWPVuza3QxRl/2BKtRW7Y+E3VSfOnPGbTnmXfh7B83BtFFaMUfr6h/4pdvteGQcWJ7Dj6oL/RqJ1n/Dmj1QccxpgFq2YOmQKtOxHv4x4b6dpWs59HOoA43Ny8qbDMAsizwGBEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mcCtA7N6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcCtA7N6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso2698609f8f.3
        for <landlock@lists.linux.dev>; Wed, 15 Jul 2026 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784104777; x=1784709577; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLOCq+q4901QS8UaLFpDknPRI2/Dvm2Tx9StZNFHsJw=;
        b=mcCtA7N6SfccxnXDEUok5360vnp1K+FnoiUog+KbnprzrN+EDfpJGbZzKN2GyuOUVG
         sAQOcbbUujaNXea4zxHTfNUveYxTq62MDvFEz8MW5gtvZ0c9P4tXJ/tYY6uQddh3LqnG
         KU/IEN0E84TaHV/K09E6evHC5Th01xFgJrHFlpevU5ZOuSlN1MkXqIQLfQYgoDjYp3HP
         8Xq8p0N59ccTsQiR7ag3UGmU9BAjXgO7fAe2zU4gSyggJVPgaQai0lHgEvoZixK1G+t2
         ySYboMbzMTyvX3agHn9KznXHa+jpv/QJAnPmw+02pd2QtNQK63fWENX0QT6HYBvv9FHu
         93kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104777; x=1784709577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WLOCq+q4901QS8UaLFpDknPRI2/Dvm2Tx9StZNFHsJw=;
        b=l4Y0X0dOPSrwT5kKvtBT5Wegsg9aZm+WFKBHRpipi9VvNs6GzOyryJN1apYAOOrgFf
         noytPBN0MFseq25dNYuJIY2/nYJxA7LZ/VogXqhaG5SReibEa9lGPs6d7PzQxeuHpeKu
         BB0t4/6nTUTpAnfbDikhUkoKZ2E6zWgGnIVsr7beKZJxlrzLbHblYad6BMHqSaG7ljJD
         1PuzGYsAN0uXAaGn9J0rD+59zotPGuoCEr8XBqoQLRaiSqiilqlJuKz0HNdJoU7zfPeW
         jz3QhOO5tb+s7yOcd21v7KXeW7Dlro6Bal4i+RxmEUk8mJEd1Ml4Rp+ZAdRycJJWkj8z
         ofmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rra0bBb0S2WIGhdwjkCTvCP4BoHBo4sKd2jLELBj8DnA3iv9Dp76LJm/XEuo8ySbkzoqyQirbdCKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCZxLru06StQsCHhgUphX1fwLCwdb9irgMJV1VhgR+lNfHGDT/
	wZCPFkMxzD8yKio5tSlbf2HYdx3y6sk7KEDrkhYa2VGeuaLlNuDviM58VgMD2URdPQ==
X-Gm-Gg: AfdE7cn1eWQf7n/8QrbyNkrOPd34VD8ZNJlWX28Gw7Hske7gm4cqNbNWb42f/0s+sS2
	VIcSPmn4QyZujq0De25K8NQKm+/4alkacMCnMdKGj2A6b5a09VD8CEvJoJVbzAkU/rGRZrpbJb7
	S7W0pyEXHWNDjbIK/uDJNyQbvO6DPRRIHm0F2vnPMdHvhkJUY2iyX7bz/Mf1QIwWKxPxyv3ruRx
	EcTHCB/++KY61YRZKGRmmUHdpj0n4rTOsi+PTk0rbaC/+stsPTnOOG4odLrvAhfkik90Xuy0xq9
	za1Qyl6ab4IGNYeSZ9jp7mxMhMytk5cCCWUox1LugTk7Mc1/f2q6bKac94chiC9iI+yny45QgfM
	R2sTCInXep/3blPG7dRuOMEV9Wn+p4LJmNP9YGYT1R9Dz+wWPfzqbWtYyqdHaTawO8vOwhWhUiQ
	tl3FiigB07Y2r0g3zsfXLp0flMw6WbUxwUbd4RkDfJMhw=
X-Received: by 2002:a05:600c:699a:b0:493:b783:ad59 with SMTP id 5b1f17b1804b1-495389dc078mr58391605e9.14.1784104776541;
        Wed, 15 Jul 2026 01:39:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:53b8:23d6:e5b4:dc54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm154561155e9.13.2026.07.15.01.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:39:35 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:39:29 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Ken Grimes <ken@kengrimes.com>
Cc: "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	landlock@lists.linux.dev
Subject: Re: [BUG] Landlock denies LANDLOCK_ACCESS_FS_EXECUTE despite a
 correctly-anchored PathBeneath rule (contradicts selftest layout1.execute)
Message-ID: <aldGXyfBQz8GsAMn@google.com>
References: <P8RYlSi7C7oum2lk1F3PumYSvaUyd0Sn_VwUYAcWwjbQxSt_Rau30Aa1oLIEnLZ2iafcsFmEG5C4LTeBWCyd9vCx94FYeTX_OJdHoERcWSI=@kengrimes.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <P8RYlSi7C7oum2lk1F3PumYSvaUyd0Sn_VwUYAcWwjbQxSt_Rau30Aa1oLIEnLZ2iafcsFmEG5C4LTeBWCyd9vCx94FYeTX_OJdHoERcWSI=@kengrimes.com>

Hello Ken!

(Also adding landlock@lists.linux.dev to CC)

On Tue, Jul 14, 2026 at 09:07:56PM +0000, Ken Grimes wrote:
> Hey all, this is my first bug report for linux. The issue was discovered 
> alongside llm-assisted coding on a downstream project. The 
> investigation/testing of the bug was a mostly manual process so I could 
> be sure this was something real. Please let me know if I can provide any
> further details or assistance. Hope this is helpful, thank you for all of your
> hard work!

Welcome and thanks for reporting your first issue!

I believe the issue you are observing is that the /bin/true program you are
starting is a dynamically linked executable.  As such, executing it requires
both the LANDLOCK_ACCESS_FS_EXECUTE right on the binary itself and on
the system's dynamic loader binary, which usually lives in /lib/ld-linux.so.*
(but there are symlinks and 32/64-bit differences at play as well, which
influence the actual final location).

You can try this out with the following experiments:

(1) Compile a "true" program statically and try using that:

    $ echo 'int main() { return 0; }' > true.c
    $ CFLAGS=-static make true

    This can be started with the test you have,
    unlike the dynamically linked version.

(2) Alternatively, add execute permissions for the dynamic loader:

    Add an additional "path beneath" rule that allow-lists the execution
    access right on /lib/ld-linux.so.2, /lib64/ld-linux-x86-64.so.2 or
    wherever else your dynamic loader is.  (You can discover the actual
    location using "ldd /bin/true".)

With either one of these two changes, your standalone reproducer program
starts working again.  Or at least it does on my machine.  If it still doesn't
work on your end that way, please let us know. :)

I admit that we should probably point this out in the Landlock documentation
for the LANDLOCK_ACCESS_FS_EXECUTE right, as dynamic linking is common and it
is a potential issue that many people might run into.

For background on the dynamic loading mechanism, see the man page ld.so(8) [1]
and the LWN article "How programs get run: ELF binaries" [2] (specifically the
section "Dynamically linked programs").

—Günther


[1] https://man7.org/linux/man-pages/man8/ld.so.8.html
[2] https://lwn.net/Articles/631631/

