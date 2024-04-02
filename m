Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAEA57302
	for <landlock@lists.linux.dev>; Tue,  2 Apr 2024 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712049115; cv=none; b=l3KN5yfNEqglW4oi+nu5xJ7nX6DV4t0YXea/JIQrYuqYxQFEJBKVNlmepwGT4torAgUre/9vhw2MzjcgjZufoNhzdW0K9pSlUMpsd0yS5SPs1PF/b6hgWxJnGqlnwRjpDMOrkbcyuRbhIdxSky8O054eLl8hv9XoNcRrFLFutIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712049115; c=relaxed/simple;
	bh=sKqJp7vcl4EgtXORPuAwcfejyaON/Z+43VEmnayhdZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHzAuwCLu/dTgebMYxvkTQ/2s7NOU4dpCiI3DK4S5bOW5sEQiBk/CrpioOsG29JaSmCC2SY4V7tdSMJ3IxiZhWIshZDxspvOVyY864KgGTIY8jtkaV/0b/S36tnTV9B6mlTRZe5sHmTqiW4Hz93BMI4AofEymCbGVGFlJCtCAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=ta8h0mJC; arc=none smtp.client-ip=83.166.143.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="ta8h0mJC"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V82F82llrzFXF;
	Tue,  2 Apr 2024 11:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1712049100;
	bh=sKqJp7vcl4EgtXORPuAwcfejyaON/Z+43VEmnayhdZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ta8h0mJCXBe8IORn5FP0rDw/tmqI0b73or9FNasNrlm7TGFb8YXn0NkuGfzjZKfSM
	 gPx3Td3JKwTRa5vihxee2GqqG3slJAEPAopwz32AixwLtl1fqleIST9HsYDp2Jdx46
	 8Uq4tXkKCpPTLoPnvr2z2k8UT59jDQJeH9ZzpVuY=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4V82F76B8VzMppDq;
	Tue,  2 Apr 2024 11:11:39 +0200 (CEST)
Date: Tue, 2 Apr 2024 11:11:39 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: landlock@lists.linux.dev
Subject: Re: R/O protection for lower level dirs
Message-ID: <20240402.quaQuieyohd9@digikod.net>
References: <20240401160614.32py2wrijdp5yots@altlinux.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240401160614.32py2wrijdp5yots@altlinux.org>
X-Infomaniak-Routing: alpha

On Mon, Apr 01, 2024 at 07:06:14PM +0300, Vitaly Chikunov wrote:
> Hi, 

Hi Vitaly,

> 
> I want to ensure that some deeper directory is write protected (as a non
> security measure but so that some post-install processing do not
> accidentally touch installed files).  Is there a way to achieve this
> with Landlock?

Landlock follows a deny-by-default policy, which is a good practice for
access control.  In your example, you'll need to identify the set of
file hierarchies that should be legitimately allowed, and set the
appropriate access rights on them, not the other way around.

> 
> For example, if we do R/W access to / (root tree is already protected
> enough with DAC) and then R/O access to /home we still get full R/W access
> everywhere and /home seems not restricted. Also, Landlock does not warn for
> such configuration, silently accepting it as valid.
> 
> Practical example:
> 
>   ~$ LL_FS_RW=/ LL_FS_RO=/home sandboxer touch a
>   Executing the sandboxed command...
>   ~$ ls -l a
>   -rw-r--r-- 1 vt vt 0 Apr  1 15:53 a

Because there may have several ways to reach a file (e.g. hard links,
bind mounts), it would be difficult to get, remember, and track all the
related parent file hierarchies.

Landlock ties (ephemeral) permissions to inodes, which means that one
inode with enough rights in the file hierarchy is enough to grant access
for such rights to the files beneath it.  This is checked when accessing
a file, which makes security policies light and flexible (e.g. handles
file renaming, linking, and bind mounting).

In your example, / grants read-write access to all files beneath it, and
/home grants read access to all files beneath it.  When user space
request to write to /home/foo, / grants write permission.

This configuration is then valid, and it makes sure that the security
policy doesn't break user space because of unknown directories nesting
(e.g. setting different access rights on $HOME and $TMPDIR, for which
developers don't have a way to know which one is beneath the other).

For your use case, you'd need to have different file hierarchies and tie
them with specific permissions.  For instance, you could have /usr,
/var/tmp/pkg/postinst, /tmp, /etc .  Keep in mind that you can also
create nested sandboxes or run different stages of the package
installation in dedicated sandboxes (e.g. one for the install step with
access to /usr in read-write, another for the post installation with
access to /var/tmp/pkg/postinst in read-write and /usr in read).

Nicolas is working on a complementary way that would ease sandboxing for
some use cases: https://github.com/landlock-lsm/linux/issues/28
This will help users to quickly sandbox their application instances but
application developers should already be able to implement a more secure
deny-by-default policy without this feature.

> 
> Thanks,
> 
