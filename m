Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71B41CA8F
	for <landlock@lists.linux.dev>; Mon,  1 Apr 2024 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711987579; cv=none; b=e+DL5jq78JNFc9P/cGz1KkecK0ETF5JLutf1Gxj6S4xPMlWjRvMOv9avFbVJWBiE0D9RnX/IqmpDt+KswIHWMR51NgiWZniKblTxBazicglFguIFvxiXz3PhIHuusW9IeXBwwgZeJzrpg0WXt2y5b4qAIr4Qfggc4e1doDhZYek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711987579; c=relaxed/simple;
	bh=/31T3r3jcJGcil9LKCOKJf0m68ZFY6+5ZOW0NsVMDFY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rC74+qpPD2ktN8yTU26Rf1vdJ0Eg6vrcx+SpA/rhRbdiWLuoJ7G5UPz8KKP6HB/eD9yFv6kncE68MbzKGwcbsw6jdCAZ7luxR6S0rpGUw26jIS6Fmtp+f3My9RQHvRtXOPzOgMnD7hLKe0B8HysRnQsAGeos3RkALZKaO1DeKF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id AF2AD72C8F5;
	Mon,  1 Apr 2024 19:06:14 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id A788D36D0160;
	Mon,  1 Apr 2024 19:06:14 +0300 (MSK)
Date: Mon, 1 Apr 2024 19:06:14 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	landlock@lists.linux.dev
Subject: R/O protection for lower level dirs
Message-ID: <20240401160614.32py2wrijdp5yots@altlinux.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline

Hi, 

I want to ensure that some deeper directory is write protected (as a non
security measure but so that some post-install processing do not
accidentally touch installed files).  Is there a way to achieve this
with Landlock?

For example, if we do R/W access to / (root tree is already protected
enough with DAC) and then R/O access to /home we still get full R/W access
everywhere and /home seems not restricted. Also, Landlock does not warn for
such configuration, silently accepting it as valid.

Practical example:

  ~$ LL_FS_RW=/ LL_FS_RO=/home sandboxer touch a
  Executing the sandboxed command...
  ~$ ls -l a
  -rw-r--r-- 1 vt vt 0 Apr  1 15:53 a

Thanks,

