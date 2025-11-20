Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2D6283FC9
	for <landlock@lists.linux.dev>; Thu, 20 Nov 2025 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660223; cv=none; b=Mhm8e0w/REjQ94T/kF06EN3qZf42ohxmFy3g0DeqUs57xPjnyED7+fMNZbvBViMK7D4GvK8GuWHLMW8ClepZU+0TvlU/y3Jz66X26ZFIxKctNx9b57qYNk+/VjmX4R7nmaA/8PNhtCY4wkWbW0wcQs2vfhgzm6AQdj+bm3lsSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660223; c=relaxed/simple;
	bh=0VfgAEjKldPQwydtqPMJuyd3KdZA9/00f6T0R9g5qmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+ZROBNKEDrR60rWsEYARHG+ZTWzfY6RSMOpuhoyF8BzzWjXY6BVg6Q2INK7V0CBrFZd5Ion1al0DJiRVy7W/USMV9h9ScuiSlSyHAxEZdMaisPqCj1XBglhKxJpOxr4P52H8y0DN5BC8XEHKg1YSA7GO8XKIMps4plLeHGbzeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=E3B6YT4O; arc=none smtp.client-ip=84.16.66.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="E3B6YT4O"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dC5Bb27KDzsbP;
	Thu, 20 Nov 2025 18:36:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1763660215;
	bh=wJ5IfDZ/efOEFQu5qKaQfH3CQ8LeuFSpX1CLvaq1Hi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3B6YT4OLSi7+/hzxDcjXtjfzrdJf9mkapem0RHv1SZgsGnKKWXvNiGK1dSQQEtvd
	 ccGtKzl6l6eyR7ER7PDhCZ2GXNk7WJcHA8uSkhQlSyIAQbpYMNCvZ4qYUAKLNfsee4
	 VRBUG7BfaQNDsx3TKi4X6Kcrk+Hol4XL2yITwL+w=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dC5BZ59Kyz41g;
	Thu, 20 Nov 2025 18:36:54 +0100 (CET)
Date: Thu, 20 Nov 2025 18:36:50 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Marek =?utf-8?B?S8O8dGhl?= <m.k@mk16.de>
Cc: landlock@lists.linux.dev
Subject: Re: Question about using Landlock
Message-ID: <20251120.aeC5eePhof6e@digikod.net>
References: <20251119211937.52cd76a3@ciel>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119211937.52cd76a3@ciel>
X-Infomaniak-Routing: alpha

On Wed, Nov 19, 2025 at 09:19:37PM +0000, Marek Küthe wrote:
> Hello,

Hi!

> 
> I would like to use Landlock in my program to improve security under
> Linux. I have a few questions about this:
> 
> 1. The documentation uses the Landlock functions without syscall. [1]
> For example, `landlock_create_ruleset` instead of `int
> syscall(SYS_landlock_create_ruleset, ...)`. In which header file are
> these landlock_* functions declared? My compiler says it cannot find
> them. As a workaround, I currently check whether these functions exist
> when configuring the project [2], and if not, I create them [3].

There is no glibc wrappers for the Landlock syscalls.  However, we have
some plan to make them available along with some useful helpers, see
https://github.com/landlock-lsm/linux/issues/38

In the meantime, your approach looks good.

> However, this workaround also has problems: syscall returns a long and
> the Landlock functions return int, which means I have to perform a
> conversion, but there is a possible loss of information from long to
> int.

Syscalls on 64-bit architectures indeed return a 64-bit value, but for
syscalls to be compatible with 32-bit architectures, they should not
return values that cannot be represented by a 32-bit value (except
arch-specific types such as pointer or size).  It should be safe to
translate the returned values of Landlock syscalls to int.

FYI, the reference example is here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/samples/landlock/sandboxer.c

> 
> 2. I don't quite understand how to add rules to Lockland's rule set.

I don't know about Lockland but I'll help you with Landlock. ;)

> When accessing the file system, I'm supposed to specify the fd of the
> file, but then I already have that file open. And that's exactly what
> Lockland is supposed to control.

The goal of a file descriptor is to identify a file or another kernel
resource, without race condition, and in an absolute way.  It doesn't
mean it gives access to the underlying resource (but that's the case
most of the time).  With Landlock, it is encouraged to open files with
O_PATH (see the sandboxer.c example) to avoid leaking opened
files/access.

Using file paths for kernel interfaces should be avoided.

> Another problem is that I work with
> several libraries: for example, `yaml-cpp` to read my configuration
> file, `libtuntap` to create a TAP device, and boost.asio to read and
> write from this TAP device. These libraries create files without me
> controlling this with my own syscall. How could I integrate Lockland
> there?

If they create temporary files, they should do so in $TMPDIR, which you
control.  I guess other file creations should also be controlled by the
developer.

> 
> For example, I create the TAP device (before Lockland controls it) and
> then try to restrict access with Lockland. [4] However, I am unsure
> whether I am using Lockland correctly.
> ```
> tun_tap dev(config.get_device_name(), tun_tap_mode::tap);
> [...]
> landlock_ruleset_loop.add_path_beneath_rule(LANDLOCK_ACCESS_FS_WRITE_FILE
> | LANDLOCK_ACCESS_FS_READ_FILE | LANDLOCK_ACCESS_FS_IOCTL_DEV,
> dev.native_handler());
> landlock_ruleset_loop.restrict_self();
> [...]
> const Crazytrace ct(io.get_executor(), ::dup(dev.native_handler()),
> nodecontainer);
> io.run();
> ```

Creating files before sandboxing itself can make sense wrt to the threat
model (i.e. if the potential attacker cannot interact with the process
at this time).  However, you should try to open the tap device before
the sandboxing and keep the related file descriptor open.  This way you
don't need to bother with the file path of the tap device and you avoid
other potential issues.

> 
> 3. Lockland introduces scoped access control starting with ABI 6. To
> avoid getting warnings from the compiler (and linter), I need to know
> whether the struct landlock_ruleset_attr has scoped access control or
> not when programming. Since I only want to support the case where this
> is true, I would like to check the ABI version at compile time and
> generate a more meaningful error. How can I check the ABI version at
> compile time? Is there a macro for this?

Checking the ABI version at build time is not recommended because it
doesn't give any guarantee about the ABI version at run time.  That's
why the ABI should be a dynamic check.

Another thing to keep in mind is to try to enforce a best-effort
security, exactly for this reason.  We want to protect users as much as
possible, whatever kernel they are using.  However, if a specific
Landlock feature is really required for the program to correctly work,
then we might want to print an error message and exit, but this case
should be very very rare.

> Currently, I am using a check to see if the compiler can compile the
> struct with `scoped`. [5] However, I don't think this is very elegant.

If the scoped field is defined, then you should use it and update it at
runtime according to the current Landlock ABI.  See the sandboxer.c
example for such case.

> 
> I hope it's okay for me, as a landlocked newbie, to ask questions like
> this here. In any case, I would really appreciate any answers!

That's definitely the goal of this mailing list. :)

Please keep us updated about new sandboxed programs.

Regards,
 Mickaël

> 
> Best regards,
> Marek Küthe
> 
> [1] https://docs.kernel.org/userspace-api/landlock.html
> [2]
> https://codeberg.org/mark22k/crazytrace/src/commit/c9b3a0e51fadece1228f1f92522dccf0115df84d/meson.build#L101
> [3]
> https://codeberg.org/mark22k/crazytrace/src/commit/c9b3a0e51fadece1228f1f92522dccf0115df84d/src/landlock.hpp#L14
> [4]
> https://codeberg.org/mark22k/crazytrace/src/commit/c9b3a0e51fadece1228f1f92522dccf0115df84d/src/main.cpp#L163
> [5]
> https://codeberg.org/mark22k/crazytrace/src/commit/2580137d0d57b7261bd0e22e11853e9e75c2c2a7/meson.build#L122
> 
> -- 
> Marek Küthe
> m.k@mk16.de
> er/ihm he/him


