Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB82C152162
	for <landlock@lists.linux.dev>; Wed,  3 Apr 2024 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712163436; cv=none; b=hZfWEJHr8IUK1wL0G/O+HcgvJy6yULEsVNBF1WZCvNG7pe4Ny1SKP6J962A2sIxjpdImS/mPjFej6hlVNAJrWyFPv0y8PlK1+ATor1Wqh9Fl0Y18zOH6VjM9N2QpuAkgD82+fBwg/bs70SOCrRhn4s1rio2LJR1SewmQUv1vvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712163436; c=relaxed/simple;
	bh=d3cKz532nHRMCZlZp/DBOe0h2rNW+rT7NsaSu8FeLk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3XoZJvwVBsIy9hN9ZdFmRALZS8MaHBnEf2S5bQUTWAhrUDLvrz+G7nbD3GoF/tcJRdtG5UqVFoqZSCI1z8A9bh/1mgUChiCl6MTllzcWO0s4kakVW846aQJGfTAZNz3476iTHXwtHRK3L2AxHhBE7LDptYczkg7I962ftdClG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=xCcoXFLa; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="xCcoXFLa"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V8rWl2pR4zPZT;
	Wed,  3 Apr 2024 18:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1712163427;
	bh=d3cKz532nHRMCZlZp/DBOe0h2rNW+rT7NsaSu8FeLk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xCcoXFLaOKNrAk+Udo5TksruXbC83kE8sJt4ASymGR1PdtjRCv5PZVUhmjZKR8x3Q
	 0dj66gjLWRjtHwG9a63GNgivwsBV90RSc3dORzzRSpkpES/SWEJjoMOXPBktgD8MHa
	 WBvMj1vjq17RsilHtu/YjAKAK12MS1OmUPAQVcdQ=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4V8rWl04wCzXM9;
	Wed,  3 Apr 2024 18:57:06 +0200 (CEST)
Date: Wed, 3 Apr 2024 18:57:06 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: landlock@lists.linux.dev
Subject: Re: R/O protection for lower level dirs
Message-ID: <20240403.Taip4yae2ohn@digikod.net>
References: <20240401160614.32py2wrijdp5yots@altlinux.org>
 <20240402.quaQuieyohd9@digikod.net>
 <20240403152043.fc5gpqu2ghlahyyj@altlinux.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240403152043.fc5gpqu2ghlahyyj@altlinux.org>
X-Infomaniak-Routing: alpha

On Wed, Apr 03, 2024 at 06:20:43PM +0300, Vitaly Chikunov wrote:
> Mickaël,
> 
> On Tue, Apr 02, 2024 at 11:11:39AM +0200, Mickaël Salaün wrote:
> > On Mon, Apr 01, 2024 at 07:06:14PM +0300, Vitaly Chikunov wrote:
> > > 
> > > I want to ensure that some deeper directory is write protected (as a non
> > > security measure but so that some post-install processing do not
> > > accidentally touch installed files).  Is there a way to achieve this
> > > with Landlock?
> > 
> > Landlock follows a deny-by-default policy, which is a good practice for
> > access control.  In your example, you'll need to identify the set of
> > file hierarchies that should be legitimately allowed, and set the
> > appropriate access rights on them, not the other way around.
> > 
> > > 
> > > For example, if we do R/W access to / (root tree is already protected
> > > enough with DAC) and then R/O access to /home we still get full R/W access
> > > everywhere and /home seems not restricted. Also, Landlock does not warn for
> > > such configuration, silently accepting it as valid.
> > > 
> > > Practical example:
> > > 
> > >   ~$ LL_FS_RW=/ LL_FS_RO=/home sandboxer touch a
> > >   Executing the sandboxed command...
> > >   ~$ ls -l a
> > >   -rw-r--r-- 1 vt vt 0 Apr  1 15:53 a
> > 
> > Because there may have several ways to reach a file (e.g. hard links,
> > bind mounts), it would be difficult to get, remember, and track all the
> > related parent file hierarchies.
> > 
> > Landlock ties (ephemeral) permissions to inodes, which means that one
> > inode with enough rights in the file hierarchy is enough to grant access
> > for such rights to the files beneath it.  This is checked when accessing
> > a file, which makes security policies light and flexible (e.g. handles
> > file renaming, linking, and bind mounting).
> > 
> > In your example, / grants read-write access to all files beneath it, and
> > /home grants read access to all files beneath it.  When user space
> > request to write to /home/foo, / grants write permission.
> > 
> > This configuration is then valid, and it makes sure that the security
> > policy doesn't break user space because of unknown directories nesting
> > (e.g. setting different access rights on $HOME and $TMPDIR, for which
> > developers don't have a way to know which one is beneath the other).
> > 
> > For your use case, you'd need to have different file hierarchies and tie
> > them with specific permissions.  For instance, you could have /usr,
> > /var/tmp/pkg/postinst, /tmp, /etc .  Keep in mind that you can also
> > create nested sandboxes or run different stages of the package
> > installation in dedicated sandboxes (e.g. one for the install step with
> > access to /usr in read-write, another for the post installation with
> > access to /var/tmp/pkg/postinst in read-write and /usr in read).
> > 
> > Nicolas is working on a complementary way that would ease sandboxing for
> > some use cases: https://github.com/landlock-lsm/linux/issues/28
> > This will help users to quickly sandbox their application instances but
> > application developers should already be able to implement a more secure
> > deny-by-default policy without this feature.
> 
> Thanks for the answer.
> 
> Looks like it's currently impossible to create more restricted hierarchy
> inside of less restricted. I think this isn't consequence of 'deny by
> default' approach but sort of additivity of allowed permissions.
> Positive permissions of wider hierarchy will be added to more
> restrictive sub-hierarchy and supersede them.

Correct for the same ruleset.

All rules in the same ruleset are ORed whatever their file hierarchy,
but nested sandboxes (i.e. sequential calls to landlock_restrict_self())
can only add more restrictions in relation to their parent sandboxes.

> 
> To add more detail, what I tried to achieve: rpmbuild installs into so
> called 'buildroot', which is (for ALT) '/usr/src/tmp/name-buildroot'
> directory inside of '/usr/src/tmp' TMPDIR (and '/usr/src' is a HONE). When
> %check section is performed some scripts may inadvertently modify
> buildroot content which I thought to block. But because TMPDIR should be
> unrestricted (and / and HOME are not need to be restricted) it is not
> possible by any means to restrict buildroot.

The issue is that tmp is nested in src (and of course everything is
nested in /).  What about using different file hierarchies like this:
* /usr/pkg/src
* /usr/pkg/tmp
* /usr/pkg/root (which would be a bind mount of /, if this is really
  needed)

I'm wondering why buildroot needs access to / though.  Could we identify
which resources it really needs?

> 
> It is not possible, for example, to permit R/W to all existing entities
> of TMPDIR excluding 'name-buildroot', because in that case TMPDIR itself
> should have R/O permissions (it's needed to not supersede
> name-buildroot) and this will defy TMPDIR purpose.

What about creating dedicated directories beneath TMPDIR?

> 
> That work of Nicolas looks promising for the goal I wanted to achieve
> and overall Landlock flexibility.
> 
> Thanks,
> 
> 
> > 
> > > 
> > > Thanks,
> > > 
> 
