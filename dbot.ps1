$imgArray = @(
	'https://i.postimg.cc/j52fdLf9/106547778-110755847244814-9122009822454253384-n.jpg'
	'https://i.postimg.cc/vmqzzRLJ/119598729-1593324717529089-2178440989873041392-n.jpg'
	'https://i.postimg.cc/x1mtnFQH/12276914-1723411747889299-959612781-n.jpg'
	'https://i.postimg.cc/sXLhBs92/125799251-207884230745114-7492476036125381670-n.jpg'
	'https://i.postimg.cc/8sQfH4YQ/129024190-1596510403865934-5201953544473547529-n.jpg'
	'https://i.postimg.cc/tRLBwjQy/132653048-716030892644814-4423358991967854747-n.jpg'
	'https://i.postimg.cc/KzGN7GMr/14547662-318552185203628-6531940955593900032-n.jpg'
	'https://i.postimg.cc/HLC3x4WN/14659276-564308510433042-5821534849231486976-n.jpg'
	'https://i.postimg.cc/j5MhZp6V/14716556-187837345000490-1558596627596312576-n.jpg'
	'https://i.postimg.cc/vHf0dNbn/147377549-421444849091072-6803950993869783856-n.jpg'
	'https://i.postimg.cc/pTmBc0sp/152065055-710057726342475-3683469228217632690-n.jpg'
	'https://i.postimg.cc/J0g5WjdP/16464848-456585961398646-4623799557073928192-n.jpg'
	'https://i.postimg.cc/QdD0NJdy/166635211-2993628377621678-8646132606846243850-n.jpg'
	'https://i.postimg.cc/g0qs6Xn2/17933980-423408418012787-6662003865375735808-n.jpg'
	'https://i.postimg.cc/Hkt3r8Js/202524352-534803270864379-8016320995310564220-n.jpg'
	'https://i.postimg.cc/7YGNnQfc/21980574-1935250533415704-7186789083002175488-n.jpg'
	'https://i.postimg.cc/j2C49MvD/21984935-124326798314476-5045886926922448896-n.jpg'
	'https://i.postimg.cc/vHJtqLnm/22069777-1891748107818953-908063460556800000-n.jpg'
	'https://i.postimg.cc/FFnZcQs3/23164842-155453435064193-5818760145739448320-n.jpg'
	'https://i.postimg.cc/VkXB3r9W/23347387-166861533901765-6653980527164391424-n.jpg'
	'https://i.postimg.cc/ZqKHpY3P/241334955-381376260203271-4782019500067305042-n.jpg'
	'https://i.postimg.cc/TP9j3z4y/25017782-1973870429542025-28611057786290176-n.jpg'
	'https://i.postimg.cc/1t3Gnvkv/28433829-1942477859401911-1731407819321638912-n.jpg'
	'https://i.postimg.cc/vmMLMY3F/36559691-2077125342553901-1227222540452102144-n.jpg'
	'https://i.postimg.cc/rm7NBSHg/37819162-512571252510379-8519785994961027072-n.jpg'
	'https://i.postimg.cc/hPd9dzYR/39013974-2229337047287144-8284549184460161024-n.jpg'
	'https://i.postimg.cc/vT15XcH9/41439924-173954910163377-3818579148142780873-n.jpg'
	'https://i.postimg.cc/wv4hhhHg/42353265-2384461061594887-294756126486130882-n.jpg'
	'https://i.postimg.cc/T1Zgsfps/51383608-1188803421277385-1123069938459809693-n.jpg'
	'https://i.postimg.cc/7Pc3hMmN/54731540-158300051856879-498344810599285719-n.jpg'
	'https://i.postimg.cc/t4dWr0yr/59407020-430949041055090-3135300869141320742-n.jpg'
	'https://i.postimg.cc/5txvTP2f/61415502-143046126759787-4372726832862278218-n.jpg'
	'https://i.postimg.cc/q7jnT8Ny/66773668-129933378235831-5657120569004200070-n.jpg'
	'https://i.postimg.cc/131DcRxn/70489675-419375788644140-9199038248389489841-n.jpg'
	'https://i.postimg.cc/C5ffkXms/73420557-460143311512436-8858436970622813783-n.jpg'
	'https://i.postimg.cc/1RgWvzdJ/98090931-164689138349490-8979317768064638405-n.jpg'
)

$rand = Get-Random -Maximum 36

$webHookUrl = 'https://discord.com/api/webhooks/942125056547504139/lHubz6HUvW98gu-uh3erln_VnvVGb7Tazox4yt2J4XP_Z9GjK8WvWn2Gvf5QMvSYNa2f'

#Create embed array
[System.Collections.ArrayList]$embedArray = @()

#Store embed values
$title       = 'Daly dose of Gorsef'
$description = '<@&942468308203089940>'
$color       = '1'

#Create thumbnail object
$thumbUrl = $imgArray[$rand] 
$thumbnailObject = [PSCustomObject]@{

    url = $thumbUrl

}

#Create embed object, also adding thumbnail
$embedObject = [PSCustomObject]@{

    title       = $title
    description = $description
    color       = $color
    image	= $thumbnailObject

}

#Add embed object to array
$embedArray.Add($embedObject) | Out-Null

#Create the payload
$payload = [PSCustomObject]@{

    embeds = $embedArray

}

#Send over payload, converting it to JSON
Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
