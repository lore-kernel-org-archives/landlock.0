Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351873F7A9A
	for <landlock@lists.linux.dev>; Fri, 25 Sep 2026 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360364; cv=none; b=iXA319lCrj1XOsCVV8fOA1v5P3Wzcb0qaz7pLcDa/Hf0ifQwQveqfEor/lgaKlzMH+WAUkHHGCFRp05H87osvLDfZR4L+IeCrMlPS3I7FiplmN3X7/5g964RajGOuKh8q6DFwnW8cCqxgpz6ac7BrtDyTWvSq2C+aJuUFr9XHOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360364; c=relaxed/simple;
	bh=C5uOoSM0vQaIiGRLqEu5g/IapqjhyqSh9xKZKI5jm6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0sWyPYGSWeGrhRp+Xa28qkQlCBdoJGrb18hBynJsDVlIJLWYAYozLZM+KhLJXZOrSfH6/huaayn0Lpbd0xXrVxXifZu55lctvs7WnRLY9FOEInAFjuKO9xiej4gbCc7s6J/M4Ro/P75VYpIBt+Uwukks8CmOsijaLRz5+z9U04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0jGQJU3; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0jGQJU3"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-673ba589d0dso1248789d50.1
        for <landlock@lists.linux.dev>; Fri, 25 Sep 2026 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360362; x=1790965162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Pgzm+oGmx9IFr7YX9pLOyiGg97pLaKByt5qjz5Pzhc=;
        b=Q0jGQJU32JllgggCvyDf3mqfqxjVVAOxk7WAU9wWWZmY6g0wnfgZgHnwOng0+ZvCgN
         vVK05xPReMEIxgYWMSWaNRkeXoVEmruCF2afw0hHiPT7w28MoORqkHhjIp1E2xEJps9o
         Ts+ATg5lR2XIIHTzPVI9Ddf55hwJ1cMit0AiUNQAY1LcibKZfkU6OhIvvc0IgcV3Xn+9
         lOrt+AH5QAMrUns8tINnI5nl0tJVFAaaevwPNHEz5O/QsG9yZmLZjY0Q/tb2RXbMsSmQ
         LvdFpULPHxZNywIZx8NDW+HKHyQFYK1SMxKkGwyVWITV7DeW2d84nnYhSfj2QICA8r8Q
         WHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360362; x=1790965162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Pgzm+oGmx9IFr7YX9pLOyiGg97pLaKByt5qjz5Pzhc=;
        b=g+59YJ7+/GOLdRwtiNBpFPUaFW3wWNY9dDbI6GKAjplw6T7JxTlidSvbMB0wyKwa5B
         vYJN11m5qq/+fInLUraP8fgYVnDCu7zWT524OafDUDtPKWOaLIyepw/kPm3KXGQxUaO5
         9uyDyKAX+5noHjna+uVCfdQj+Nl4Tr7hErFXBqzkBvO+3qWyTNCJ2NIt0HyxkdSWPhzR
         EKwEkRW6H9/k7+B3W76boBdyK58s6J0LdX5XX6D8uAvs3dVDW6wmL7HThUWhCDlGP4SU
         yROPSTBQSS302ex+88j9YMsO83O5zgSJsqB63NsuXQxml52pmU9zJT4oeS8lRYlaRexc
         iwRQ==
X-Gm-Message-State: AFuF++mNH7+GfBRFUdbWmbdF55K0xh7fqb0dgFwBac24yOjWWIUJZHXz
	vOU+6ytxfqVOta8S3uEVKI2dPag0k8CNDC3ELid4f05/u+vNcGzVPhL0hWKmUiATSfM=
X-Gm-Gg: AYBFou2BHKmZys7Jr6q2nDB2VHS93qK5nSJ0rsHiRhID6IxKoHdPoh0PPGNwd/4vkfn
	g13Ezs3kfrolGTb8l/Sw8Z8uezyw5N/LcemSGm1BM8OcSPmJ2+UBHlAegS0JUQ1bjK2BH4/NpxT
	HeB/qWKss+nSJfwKVhgqr4AKgrBwepm7oHlxba6aUnQ+HiP/W4r9/kE9mUeG/7bl0vIuZ3FTVnj
	cGkL/JAf/hAOZNhJ1kOdljmxe8zC1JeFIc2dwjzkNBH2v7HWK3wmf2+2df5usXrKFIZIINrFHB4
	0Ya1rEHJ3s3/uGXnqwkCttySmsyB0uhHpqUQvWdaaR9EmOfVG1/iyGyclo95Dy6HGmRsr4OUB4e
	lOyOlCnXRjFl9Rp4fSQrV/zrGfXSy/6cdF7lSzlCxqHAFs7i6UvBhd0SFh4/c4BuHS33S/koJD5
	nSZaRln5uM4SCcsbCzrczZgxPfJUmZMVHY8FWTk/WOnfXeBjxBCMm7bCubXWxbvn/vjE84qRvFq
	cg=
X-Received: by 2002:a05:690e:4141:b0:673:5043:ab33 with SMTP id 956f58d0204a3-6735043b074mr2459368d50.28.1790360361793;
        Fri, 25 Sep 2026 11:19:21 -0700 (PDT)
Received: from suesslenovo ([71.132.185.69])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740ee92ebcsm1325006d50.6.2026.09.25.11.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:19:21 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:18:50 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Kate <kit-ty-kate@exn.st>
Cc: landlock@lists.linux.dev
Subject: Re: Restricting all (ICMP included) network access
Message-ID: <ara5OnFKQCidTeWx@suesslenovo>
References: <bff77061-37e3-4361-b021-3d1e46be3b87@exn.st>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bff77061-37e3-4361-b021-3d1e46be3b87@exn.st>

On Wed, Sep 23, 2026 at 11:28:57PM +0100, Kate wrote:
> Hi,
> 
> I'd like to use landlock and i've tested the sample/landlock/sandboxer.c
> example from the linux sources, however while TCP and UDP (if i had linux >=
> 7.2 / API >= 10) are correctly restricted from what i can see, ICMP (ping)
> is still able to communicate with the rest of the world. I suspect other
> protocols not based on TCP/UDP are able to do so as well.
> 
> I've read somewhere that ICMP can be handled by BFP instead but that API
> seems a lot more complicated than necessary for what i need (maybe i've
> looked in the wrong places though?), so i'm wondering:
> 
> Does anyone has any tips on how to make sure no network access of any kind
> is able leave the sandbox?
>
Hi,

This doesn't use Landlock, but you can use unshare and create a new
user namespace and an empty network namespace without root.

You can demonstrate this with the unshare -Un command.

For ICMP specifically, it already requires CAP_NET_RAW if I'm
not mistaken. (usually the ping binary is setuid or has file
capabilities for CAP_NET_RAW which is what allows unprivileged ping).
So you can drop that capability if you already have it, or set no new
privs (already required for non-root Landlock usage) to prevent
regaining it through the ping / other setuid binaries.

There's currently no ICMP right specifically for Landlock.

But yes, you can achieve this, without even needing BPF or Landlock.

Justin
> Cheers,
> Kate
> 
