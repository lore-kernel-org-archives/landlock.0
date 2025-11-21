Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9CE1F09AC
	for <landlock@lists.linux.dev>; Fri, 21 Nov 2025 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735553; cv=none; b=qDe+NYGZv6s/AZ6eI0wWoZimq2osUfxySVkg0aDolvZvlq8AiI0NFZlvVKk0i499ZOppcCkeETCj6LfwjTcLT9eJOBHZ5QWho1+o07s4/F7sijo+nm6f4Sjuo/ou3BDnu/GnjdBEZ2HMvmXjDkIzCzCFEQKEXVD5PMQP5RsfCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735553; c=relaxed/simple;
	bh=cJriJulVRrmpHfBClqkse29DGSvGIAFqp4+AoaAvfQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxsLyTrTyH/AfOua38tHqoyDLFpX9B9j/tcT8Db9ZIFE+AD/OjaBIA2ifLC1n0veidPPA51YOZzP6jIsDT3e8m0Ptq2s+ToRD9cOMYLvraG8Dl0osH2JRif04ybp70/IG/Dsx12I0unahFyOjPl2wCuf1iCqaheFphqPq2pN0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=iRiwOFle; arc=none smtp.client-ip=185.125.25.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="iRiwOFle"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dCbTK4C1mz4RM;
	Fri, 21 Nov 2025 14:21:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1763731285;
	bh=wMjiNbtaLLS40l4k4QLRWlvODz+ffuP6QIvfmzVFU6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRiwOFle+viZOs9Kp7Apb84Bf6BLdf+fLC5RjOenYY/PeX0wW1cQr/dYbh0zi53yE
	 SrBMnkBxEZ9sZfO4x+mj5mYOYr8VQqrHZxxSrd9pz59IA0WRHOHiqUf7GY5Sx7N9Pm
	 0k5ueOiDnk9P+bcZBmt+FSEaKJFeLKpDBeP/npP4=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dCbTJ5Yd7zS29;
	Fri, 21 Nov 2025 14:21:24 +0100 (CET)
Date: Fri, 21 Nov 2025 14:21:18 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Marek =?utf-8?B?S8O8dGhl?= <m.k@mk16.de>
Cc: landlock@lists.linux.dev
Subject: Re: Question about using Landlock
Message-ID: <20251121.eeM6eighaose@digikod.net>
References: <20251119211937.52cd76a3@ciel>
 <20251120.aeC5eePhof6e@digikod.net>
 <20251120203745.32463645@ciel>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120203745.32463645@ciel>
X-Infomaniak-Routing: alpha

On Thu, Nov 20, 2025 at 08:37:45PM +0000, Marek Küthe wrote:
> On Thu, 20 Nov 2025 18:36:50 +0100
> Mickaël Salaün <mic@digikod.net> wrote:
> 
> > On Wed, Nov 19, 2025 at 09:19:37PM +0000, Marek Küthe wrote:
> > > Hello,  
> > 
> > Hi!
> 
> Thanks for your answers! That answered many of my questions.
> 
> > > When accessing the file system, I'm supposed to specify the fd of the
> > > file, but then I already have that file open. And that's exactly what
> > > Lockland is supposed to control.  
> > 
> > The goal of a file descriptor is to identify a file or another kernel
> > resource, without race condition, and in an absolute way.  It doesn't
> > mean it gives access to the underlying resource (but that's the case
> > most of the time).  With Landlock, it is encouraged to open files with
> > O_PATH (see the sandboxer.c example) to avoid leaking opened
> > files/access.
> > 
> > Using file paths for kernel interfaces should be avoided.
> 
> Could you give an example? I think you mean fd's that don't refer to
> anything in the file system?

I mean that dealing with file paths is racy, it's much better to open a
file once and then perform operations on the related file descriptor
instead of on the same path.  For instance, you can do a lot of things
with syscalls ending with "at" (e.g. openat2 + AT_EMPTY_PATH, ioctl,
read).

> 
> > Creating files before sandboxing itself can make sense wrt to the threat
> > model (i.e. if the potential attacker cannot interact with the process
> > at this time).  However, you should try to open the tap device before
> > the sandboxing and keep the related file descriptor open.  This way you
> > don't need to bother with the file path of the tap device and you avoid
> > other potential issues.
> 
> Thanks for the clarification. I'm new to developing "secure programs"
> and still need to learn how to create (useful) threat models.
> 
> > > 3. Lockland introduces scoped access control starting with ABI 6. To
> > > avoid getting warnings from the compiler (and linter), I need to know
> > > whether the struct landlock_ruleset_attr has scoped access control or
> > > not when programming. Since I only want to support the case where this
> > > is true, I would like to check the ABI version at compile time and
> > > generate a more meaningful error. How can I check the ABI version at
> > > compile time? Is there a macro for this?  
> > 
> > Checking the ABI version at build time is not recommended because it
> > doesn't give any guarantee about the ABI version at run time.  That's
> > why the ABI should be a dynamic check.
> 
> But I would like to have a build-time guarantee that certain data
> structures are available in a certain form or that certain macros
> exist. Hence my question about build-time checking.

You can check the size of a struct at build time, and then infer which
fields are part of it.  We should probably add some helpers to make this
simpler.

It's OK to just copy the header file though.  You'll need to update the
code to leverage new features anyway.

> 
> > > Currently, I am using a check to see if the compiler can compile the
> > > struct with `scoped`. [5] However, I don't think this is very elegant.  
> > 
> > If the scoped field is defined, then you should use it and update it at
> > runtime according to the current Landlock ABI.  See the sandboxer.c
> > example for such case.
> 
> But that assumes that the field exists at build time, and that's
> exactly what I want to check.

sizeof() should help.

> 
> If I try to initialize a non-existent field, there should be an error
> from the compiler (so I want to catch that beforehand). And if I don't
> initialize an existing field, clang-tidy complains.

You should always initialize the Landlock structs to zero, otherwise
you'll get undefined behavior (depending on the content of the stack).
We can initialize a whole struct with empty curly braces e.g.:

  struct landlock_ruleset_attr ruleset_attr = {};

> 
> As far as I can tell, sandboxer.c always assumes at build time that it
> has been compiled with a new version. Or am I overlooking something?

That's correct, and it's the case because the landlock.h file is always
provided with this example, part of the Linux repository.

> 
> -- 
> Marek Küthe
> m.k@mk16.de
> er/ihm he/him


