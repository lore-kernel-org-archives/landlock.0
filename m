Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E3125DE
	for <landlock@lists.linux.dev>; Wed, 17 Jul 2024 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721206266; cv=none; b=iRlfbh7jh1CK7PctUIsZHj8ydrtt5aaVfnFjotvCScIJnFpoRlRlFxQxaKe4tsygPGCegh6xNW1Jl8Ri5IsmfrYxXddqWRHW33z6NOPfocfCVmHM3ThtUz/NkvbuRXxz5XA/ScBpSmNk1lTeNCn2US6euYxWQAg/2BWE+PDjVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721206266; c=relaxed/simple;
	bh=8r+JDFGB+ol9fUddXgnesjMn2IfP8Fmi/An7rOPpwnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQVVA3LMCa/SNZpMeKyvomaLEJU3poyu2oXEoqacivZ7MOwWta6F+9W4W+0Tg4Qz7+MIpdccayotZRkLFQUTg8z2YcD0JfFyjHHkdg2bv1b3lAp431BFlwJF9K19ujk0YONpPLHCmpqPuq6zzzEDFkf+zLh5S0+HFQEunPFSzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4gOJPkX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4gOJPkX"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so10659713e87.3
        for <landlock@lists.linux.dev>; Wed, 17 Jul 2024 01:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721206262; x=1721811062; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCd24bD+zExd4e33cS8ZBvjHCjQh/kwrQJGanmPzUDU=;
        b=P4gOJPkX8soZUJtCVNWu7zMYxb5ruaJvWjFdQcvubrx5OlIVV/lGfxmBKisaf3acp2
         cRcErXkLR4sJEg+HJm+16evDXlvsj40dEUesqZdaKEN8vuccXSlBIBMb63IJdJvWFEFZ
         dN4atTs/bjcNFAtOK8d0A8whdeMMG1H7HAxt74rZybMWc+hcnyMN0hissSWig1d1nOXM
         /ejugopm4IAZ9oM/Sr94RAvktqouMyRNMzSG+SuhnryxVqsSP3m+WlNzEa7FrnlPVER9
         TMEOlmQ+w+ask3sMRuuidh9jdC87zOTs3pfPfpo4kes2+N2zw4mgEFFEh4misQdYIdgj
         T8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721206262; x=1721811062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCd24bD+zExd4e33cS8ZBvjHCjQh/kwrQJGanmPzUDU=;
        b=Cpa+dIlhQtlUnV4haPnJgj2+/0tSfXIl4hrhd1o2eVYbwsfAi0Hi8lpM4tsqqx116j
         U4NowK5HO2g6k8gkx8CGAiZVXR6/wnuQFk06oX+KR0Wz8IHxFoUBzvlPv4jOLPl387Ai
         9dcuEQBQeDDP7T9kbTYSnnpCpQ252v52+63zOOa2/PkRvi/B42hSlFSGzX8e8KvLnatE
         Sh74xYh8yXg6tnnFUXuwTsiwD5r1o7lr0jeDhnG2/hHsbPG42C1CNgr/GqrF3drtqZY4
         sHSy0nrtYLrZE0qNFK/GK8qtX8PtO92BCqFsXXEluDp+5ffzurL6ui1qI3Ut96pwOg+h
         c3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+wzuQbaW+B02+0rxWbJ/fSknNqcTib3d18OgVGQkS1MMZgdcI7avAQMVnA+TWA45BCMkS8aKEvM6ezw18chkLQ7UrC/DLnp0=
X-Gm-Message-State: AOJu0YzkWdqc2M7tc/XeY9mA97eLpCveC9p+ruaK+7tWyMTdTd072Why
	z87BkLylHp7cYyzUg/LKaaH97XKFiqkemjwxP7B+ANFkCJojF+kg
X-Google-Smtp-Source: AGHT+IFf9ipmjxNKEu1QqDwNJKxRKv1S8/4sHGlTcErbR0cVpDADIgqR1lTiVVC0SNT/P8FZflQMOg==
X-Received: by 2002:ac2:4c41:0:b0:52e:9cc7:4462 with SMTP id 2adb3069b0e04-52ee53a7234mr989762e87.11.1721206261800;
        Wed, 17 Jul 2024 01:51:01 -0700 (PDT)
Received: from localhost ([2a02:168:59f0:1:b0ab:dd5e:5c82:86b0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff9f0sm420724166b.160.2024.07.17.01.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 01:51:01 -0700 (PDT)
Date: Wed, 17 Jul 2024 10:51:00 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Andrea Cervesato <andrea.cervesato@suse.com>, landlock@lists.linux.dev
Subject: Re: Help with LANDLOCK_ACCESS_FS_EXECUTE
Message-ID: <20240717.388d6f809b52@gnoack.org>
References: <5dcec431-4089-4c73-93c6-eda0e0616ebc@suse.com>
 <20240701.Pe4zeeph4epo@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701.Pe4zeeph4epo@digikod.net>

Hello!

(Re-sending this message from July 1st for the record, as it was
previously rejected by the mailing list and only went to the
discussion participants.  The problem was resolved in the end.)

On Mon, Jul 01, 2024 at 05:16:19PM +0200, Mickaël Salaün wrote:
> On Mon, Jul 01, 2024 at 04:25:53PM +0200, Andrea Cervesato wrote:
> > Hi all,
> > 
> > I'm actually writing a test for LANDLOCK_ACCESS_FS_EXECUTE flag in LTP [1].
> > The test is really simple: it applies the EXECUTE landlock rule inside a
> > folder and it verifies that a binary inside it can be executed.
> > A similar test applies the rule only to the specific binary and check again
> > its execution.
> 
> Good to know you're working on that!
> 
> > 
> > But while I was writing the test, I encountered an issue with the specific
> > rule setup, since EACCES is raised unexpectedly during binary execution.
> > So I wrote a reproducer, assuming that LTP might be the issue, but it's not.
> > The reproducer actually shows that binary can't be executed after applying
> > the EXECUTE rule.
> > 
> > I will attach the source code to this email. Can you please tell me if
> > there's something wrong with it?
> 
> I guess the binary you're trying to execute is dynamically linked, which
> means that the kernel needs to open the related .so files on behalf of
> the calling (sandboxed) process, which means that
> LANDLOCK_ACCESS_FS_READ_FILE needs to be allowed on these files.  You
> can use a static binary to avoid this kind of issue, or just not handle
> LANDLOCK_ACCESS_FS_READ_FILE.

I've tried this out, it seems that it actually needs both
LANDLOCK_ACCESS_FS_READ_FILE and LANDLOCK_ACCESS_FS_EXECUTE on that
file in order to execute it, even if the file is statically linked
(LDFLAGS=3D-stat= ic make landlock_exec).

Once you have execve(2) succeeding, it gets more complicated with
shared libraries in the mix.  If you are looking to support something
like that, it helps to read the man page ld.so(8) to understand what
paths need to be whitelisted for shared libraries. The XDG Base
Directory specification can help with the location of config files. (
https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.htm=
l).

Your program runs nicely under `strace -f`, which helps to debug the
exact place where it fails - I tend to use something like that as a
driver for making it work.

–-Günther
