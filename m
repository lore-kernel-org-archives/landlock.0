Received: from saaz.rutschle.net (saaz.rutschle.net [51.15.243.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1261378
	for <landlock@lists.linux.dev>; Fri, 16 Dec 2022 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=rutschle.net; s=20170610; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DcOqRi6Rs4r0y5mk9kzzQeC4Sh4DYonfHPNYcNnZ1VE=; b=W2mZCXWhj+n4XMDufw9tf7qM2w
	Qck4TvW9s8M/QReBx5uMw/Sru2StnujHeklxRSkuL+4w/gEe07ikOQPjgZ7vfANz6qDqC5YcwDvTD
	oRG5+lu70R8Zjs8uGO9LNflMjwW9X424xDQFoo9i/sL+jCgstCTOA77khM4ZgBJxHpyU=;
Received: from yves by saaz.rutschle.net with local (Exim 4.92)
	(envelope-from <yves@rutschle.net>)
	id 1p67PA-0002Ty-En; Fri, 16 Dec 2022 09:53:24 +0000
Date: Fri, 16 Dec 2022 09:53:24 +0000
From: Yves Rutschle <landlock@rutschle.net>
To: =?iso-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Yves Rutschle <landlock@rutschle.net>, landlock@lists.linux.dev
Subject: Re: Landlock setup
Message-ID: <20221216095324.GO15113@rutschle.net>
Mail-Followup-To: =?iso-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Yves Rutschle <landlock@rutschle.net>, landlock@lists.linux.dev
References: <20221107172216.GA10688@rutschle.net>
 <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
 <20221108112722.GB10688@rutschle.net>
 <f0b57f51-e7c8-41f6-28eb-5dcb11686cc2@digikod.net>
 <20221108171518.GC10688@rutschle.net>
 <fd1007af-0ddf-1fe9-0c5d-e52eec412426@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd1007af-0ddf-1fe9-0c5d-e52eec412426@digikod.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mickaël,

On Fri, Dec 16, 2022 at 10:44:45AM +0100, Mickaël Salaün wrote:
> Hi Yves,
> 
> How did your investigation to use Landlock go?

I havent had time to dig much into it. Something I thought
might be a problem is that I retrieved landlock.h from your
git, and I wondered it might be different to what is
required to work with my stock kernel.

I'm hoping to find some time to look at this over the
holidays...


Cheers,
Y.

