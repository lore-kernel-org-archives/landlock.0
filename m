Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F4E31A062
	for <landlock@lists.linux.dev>; Fri,  5 Jun 2026 19:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687155; cv=none; b=TUK83L6MZG31bSD0Q2NswCMAejyJtOmTz1mQk9Y9TRXRBIZXfbkJA2K+I2YdyW2GQ6+ICvbzrErrR3dE9dcpt5Mqjmq2Cwi+RPYevjaUAiH57mcpsppGd4/DcMjweMoFrXXibMeuxEPOwkiCrhuQ+bir018ZD/E2WegAqSCqp0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687155; c=relaxed/simple;
	bh=B+QmkTY4Esh+jdPclIut0ljnHmY7uVWJUadN5NH0xF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGGdGJ0c+gqBQV0S0b9KwTBY/faUwM1HDdCUnGFEzwbNEYdRtmzhzifyu9bqlplqLjTt+XQoFWltX+hAIhksaoomop1Hw54lFUgt8TyuC1nmbIrHLSHhMR1b7bd8bgclYLIMVkay3yVcr++4/W10U04RtfkFAmLS36xD04eGSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/DTtBFe; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/DTtBFe"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dc93d02916so25444707b3.3
        for <landlock@lists.linux.dev>; Fri, 05 Jun 2026 12:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780687150; x=1781291950; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MOXbKZfgJXPBpY8lG/Y3v7LYtlOFATL/9fFJyN+Awa8=;
        b=r/DTtBFeEzgHbwlOnCTOCPmajMcZW7nvo65gvVR4tY33MSEXIZenKO434SXBNTpoxo
         yDJdULrWYcioL9dS30gaV7tJ9x/bEqTqadXVld9lrlV89tzZrNjWX4HtLGzfRMjjzPCe
         wZu0ZYNW0izQA4PsbciZbcy2vjh0EqpOOyCHMZtLzpFOIrz1CLhTtW3LQJ/nkX/hElAs
         /tjA7iTwSyIZaQuUc5ngTEiyobw1e4XAkzrJ2TZ/+jwd4CSPDcrYtS+Ab/Z00G0NY5Cf
         8/1zw3yMm7N726OLhEf2z/1IVsuU9mBGMvsW8mxjv4/xY9K3MDGZjgZICQbfKmJHqoFW
         npNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780687150; x=1781291950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOXbKZfgJXPBpY8lG/Y3v7LYtlOFATL/9fFJyN+Awa8=;
        b=UPzHJN8VmBU0pygtKBnNa74FsoY5hBfTVXUwJDtRSTJdqwOvmdCcTGiQPQs3Ajc1sm
         pVOuhTsLXTQFOiUx6ZrUP6Z914gU8fEh9Nx7gKW1/qwtL93sXZ/vndnIF74mD34T2ijk
         mqvJseHIViX8L+Y08bDOF7GsjDkKTY66o4Ku9dsmX/6c71CNkeATGLAyM3ucQwVBMMQv
         ihTl7/0LDGVuRNUJkPkAxNbNolv6nI6eSDwHV+GERP0fgFzER8nKmVMM0O+DFIQMm9yP
         xpt6WM7eE1WuZCqZxnyghLeUv1nl2UVNS0A3DrkebZcyK4fNnjTjrQ0UCJXuHTs9cAlU
         G/yQ==
X-Gm-Message-State: AOJu0Yzl61PYDF+S9QOV9eU7m6zQsZhvTricyi3xnfsIGgP1yphnsXx/
	xVbRCcNQV566hF5rB2XP835h5HVSXzw1kLOLmoqMWmx4O3QfFd8AIZwlhaqBOg==
X-Gm-Gg: Acq92OE43FivqlpqzJ5qsjI6oNsPmTEoG0olRwUII/i54fUxqtdwuFxh0mGfUoOHp/n
	vlSY7YeGB+SrkXFpAmJvNeOXcTQzj50bORTfIijEyS55jScErkJePgpsZ0rHUpcYk2ZHQg1Hvlr
	IhekDKN3qZSltz1WExLeO4/MKaJaKoc+yrt0RXBoHb+NPmjs0oG3QRdy154YkQccvnLe17vGIiu
	Sg7gAuov23W16UNCLqb2EHnJV2Zq8df0exsrolXvkVO/gAOdQLQXBP0UrD8ZnftwZTXdyMfJR8D
	14phnyXGDvw4NU6DMpv3zx31Sefg8j2D9ahyIhCEPTtXEHmc1V+grE0r5/kZhoFYGhHI0FeYbXj
	vFE2Sw+dn0rUXP4KQ2QHkciBu1M76aCQkxvYBYwkmkv/mJ3EIA1OuP5zefQU4DkR8dhyZkFbY6U
	g93Bu1souTSqTSvnEI5jTFU5PAvyhI8XaoGZmSi65Z4PTKTbN1bUlX+NHf8tgXguR4uAyh
X-Received: by 2002:a05:690c:e3c9:b0:7a0:4146:6eda with SMTP id 00721157ae682-7ed0b0ab92dmr54115017b3.20.1780687150526;
        Fri, 05 Jun 2026 12:19:10 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:c0d0:c20d:131c:8e23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea2409db52sm53934917b3.44.2026.06.05.12.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:19:10 -0700 (PDT)
Date: Fri, 5 Jun 2026 15:19:09 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: landlock@lists.linux.dev
Subject: Re: Landstrip
Message-ID: <aiMegwnNp515dmWB@zenbox>
References: <ah41G3F850HLeiBQ@kernel.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah41G3F850HLeiBQ@kernel.org>

On Tue, Jun 02, 2026 at 04:42:51AM +0300, Jarkko Sakkinen wrote:
> I played with an idea could Landlock LSM be used to do conceptually a
> better fit sandbox for programs such as Anthropic Sandbox Runtime [1].
> 
> After some missteps at first I got it pulled together quite well:
> 
> https://crates.io/crates/landstrip
> 
> To see it in action I also have a fork of pi-hashline-readmap plugin,
> which was a cherry-picked test case I wanted to try out given it already
> hooks the bash tool command for compressed output.
> 
> I just thought that this might interest some as Landlock is not really
> over-used kernel feature in "application sense".
> 
> This is a more lower barrier and more failure tolerant to deploy than
> Bubblewrap based container for this use and purpose in my opinion
> at least.
> 
Very cool! Landlock is great for this usecase of application driven
sandboxing.

(just a quick note, the linux-security-module/linux-integrity
mailing lists mostly for kernel development patches, the
landlock.lists.linux.dev list is more for
userspace Landlock topics like this. so I removed the cc for
linux-security-module/linux-integrity and added that list)

I notice there is a seccomp policy for unix sockets in this application.
Although it might not be in your kernel yet, support for sandboxing
named unix sockets with Landlock was recently merged. :)

https://lore.kernel.org/linux-security-module/20260327164838.38231-1-gnoack3000@gmail.com/

Justin

> [1] https://github.com/anthropic-experimental/sandbox-runtime/issues/291
> [2] https://github.com/jarkkojs/pi-hashline-readmap
> 
> BR, Jarkko
> 
