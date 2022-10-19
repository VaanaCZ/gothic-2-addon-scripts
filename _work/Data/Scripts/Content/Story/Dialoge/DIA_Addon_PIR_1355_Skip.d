// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //A hele, copak to tu m�me, to u� ses zase p�iplet do cesty star�mu Skipovi?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(p�ehnan�) J� t� zn�m!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //Z�toka u m�sta, pamatuje�?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip, �e jo?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(hrd�) Vid�m, �e jsem na tebe ud�lal dojem.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Ale mezit�m jsem ten tv�j ksicht zahl�d i JINDE.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //Ale jist�!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //No, podoba sice nic moc, ale ur�it� se� to TY!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Si to tak neber, j� na t�ch plak�tech vypad�m �pln� stejn� blb�.
	Npc_ExchangeRoutine	(self,"Za��t");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "M�m tu pro tebe bal��ek, kter� ti pos�l� Baltram.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //M�m pro tebe bal�k od Baltrama.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(�kleb� se) To teda musel fakt p�ebrat, kdy� n�m sv� zbo�� pos�l� a� SEM.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Tum�, dej mu tyhle dv� fla�ky rumu. Tu t�et� jsem vyslopal, kdy� jsem tu na n�j �ekal.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Co tady d�l�?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Co tu d�l�?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Pr�v� jsem se vr�til z Khorinidu a te� �ek�m, a� se vr�t� Greg.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "V Khorinidu jsem vid�l Grega.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Grega jsem vid�l v Khorinidu.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //V�n�? A sakra! To se n�co muselo p�kn� pod�lat!
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //U� p�ed �asem m�l bejt tady i s na�� lod�.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(zamy�len�) Mysl�m, �e bych se m�l vr�tit do Khorinidu a po�kat na n�j tam.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(povzdech) Ale ur�it� ne dneska, dyk jsem sotva dorazil.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			�berfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "M��e� m� zav�st do Khorinidu?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //M��e� m� dopravit do Khorinidu?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Ani n�pad, zrovna jdu pry�. Mus�m si nap�ed d�t po��dn�ho loka ko�alky.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Zbl�znil ses? Dyk jsme p�i�li vo LO�, �ove�e!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Nebudu vytahovat na�i posledn� lo� jenom proto, �e se� l�nej pohnout zadkem a dostat se do Khorinidu S�M!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Naposledy: NE!
	};
};

// ************************************************************
// 			 			Banditen + R�stung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Co bys mi �ekl o t�ch banditech?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Co bys mi pov�d�l o banditech?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //O banditech? �to�ej na n�s!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Pro� si mysl�, �e stav�me tu palis�du?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //A to jsme sem ty �mejdy sami dopravili.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //D��v jsme s nima vobchodovali. Ti maj tolik zlata, �e nev�d�j, co s n�m, to ti �eknu!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Za fla�ku rumu by zaplatili cokoliv.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Ale ty doby u� jsou d�vno pry�. Te� spolu v�l��me!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Co se stalo?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Ti hajzlov� nezaplatili za posledn� dod�vku.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //Tak jsem za nima �el, abych zjistil, co se stalo s na��m zlatem.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Jen�e sotva jsem vlez do ba�iny, ty svin� na m� za�to�ily!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //A to je�t� nen� v�ecko. Zabili Anguse a Hanke! Dva na�e nejlep�� lidi!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Tak�e bych ti radil, aby ses vod t� ba�iny dr�el d�l.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Jdou po ka�d�m, kdo nevypad� stejn� vo�unt�le jak voni.
	
	
};

// ------------------------------------------------------------
// 						Banditenr�stung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Pot�ebuji zbroj bandit�.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Pot�ebuju zbroj bandit�.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Ty tam chce� j�t? Zbl�znil ses? 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Jestli zjist�j, �e k nim nepat��, nad�laj z tebe sekanou!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //M� pon�t�, kde bych takovou zbroj sehnal?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(s povzdechem) Ty se jen tak nevzd�, co? No dob�e, jeden kousek jsme tu m�li.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Greg ho m� nejsp� po��d ve sv� chajd�.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Mo�n� by ti ji moh prodat, a� se vr�t�.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip se domn�v�, �e zbroj by m�la b�t v Gregov� chatr�i."); 
};

// ------------------------------------------------------------
// 						In Gregs H�tte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "Nev�, jak se dostanu do Gregovy chatr�e?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Neporadil bys mi, jak se do t� jeho chajdy dostat?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Tak to prrr! Ne tak rychle!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Snad t� nenapadlo, �e by ses Gregovi hrabal ve v�cech, �e ne?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Kdy� vodj�d�l, sv��il kl�� Francisovi a nak�zal mu, aby do jeho chajdy NIKOHO nepou�t�l.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis m� kl�� ke Gregov� chatr�i, ale dostal rozkaz, aby tam nikoho nepou�t�l."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					�ber Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Co bys mi �ekl o Francisovi?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Co bys mi prozradil o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //Francis je n� pokladn�k.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Kapit�n mu v��� - a nejsp� proto mu taky sv��il velen�.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Jen�e nikdo z chlap� ho nebere v�n�.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Jestli chce� v�d�t v�c, promluv si se Samuelem.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Hledal klid, a tak se usadil v mal� jeskyni na severu.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //V t�bo�e nen� ani �iv� du�e. Samuel NEV� �pln� o v�em.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"M�l bych si promluvit se Samuelem, t�eba mi pom��e."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Setkal ses n�kdy s Havranem?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Setkal ses n�kdy s Havranem?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Jasn�, kdy� jsem byl s Henrym u br�ny, vid�l jsem, jak Havran poslal p�r svejch chlap� do v�e na jihu.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Vocu� z t�bora je to co by kamenem dohodil. (sm�je se) Nejsp� n�s maj �pehovat.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //A taky jsem vid�l, jak vyhro�uje svejm lidem, kter� ho necht�li poslouchat.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //S ka�d�m, kdo do punt�ku nespln� jeho rozkazy, ud�l� kr�tkej proces.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Dej na m�: vod Havrana se dr� d�l.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Pov�z mi o Angusovi a Hankovi n�co v�c.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Pov�z mi v�c o Angusovi a Hankovi.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus a Hank se m�li p�ed t�borem setkat s ��kejma banditama.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Nesli v�echny mo�n� z�soby. V�ecko, co si u n�s ti parchanti vobjednali.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Kujnou ocel, pakl��e a kdo v� co je�t�. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Ale nikdy se u� nevr�tili. Ta svin� banditsk� je ur�it� vodkr�glovala!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan a Bill po nich p�trali, ale bez �sp�chu.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill byl p�kn� zni�enej � voba byli na�i k�mo�i.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Je e�t� mladej, tak�e si to moc bere.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //My vostatn� jsme to zvl�dli bez probl�m�. To zbo�� si m��em dovolit ztratit. (povzdech) Ale m�li u sebe i spoustu ko�alky...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(rozzu�en�) Mluv�m aspo� o 20 lahv�ch!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Banditi pr� Skipovi ukradli 20 lahv� ko�alky. Chce sv� lahve zp�tky.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank se nejsp� setkali s tlupou bandit�. Pak u� je nikdo nevid�l.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Hled�n� Morgana a Billa je st�le ne�sp�n�.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "K Angusovi a Hankovi...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Co se t��e Anguse a Hanka...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Co?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Na�el jsem je.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Jsou mrtv�.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(pro sebe) Tak�e zaklepali ba�korama � chud�ci!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //No, ale to se dalo �ekat.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //M�l by sis promluvit s Billem, jestlis to u� neud�lal.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Ale �ekni mu to �etrn�, je e�t� mladej.
};

// ------------------------------------------------------------
// 			 			Kenne den M�rder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "U� v�m, kdo zabil Anguse a Hanka.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //V�m, kdo zabil Anguse a Hanka.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Tak to m� kliku, jen�e voba jsou mrtv�, tak kdo by se vo to v�c staral?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Pomstou e�t� nikdy ��dnej pir�t nezbohatnul.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Hlavn� jestli dostanu zp�tky svoj� ko�alku.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Je mi fuk, kdo je zabil, ale kde je moje ko�alka?!
	};
};

// ------------------------------------------------------------
// 							Grog zur�ck
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "Tady m� sv�ch 20 lahv�.";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //Co se t��e t� ko�alky...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Tady m� sv�ch 20 lahv�.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Postr�d� 20 lahv�, �e jo?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Jo, sakra, v�ecky m� z�soby.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Tady m� sv�ch 20 lahv�.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip dostal zp�tky sv�ch 20 lahv� ko�alky a je spokojen�.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Co�e? Fakt? Jen tak?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //Noooo...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //No dob�e, zaplat�m ti za n�.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Nem� n�co zaj�mav�j��ho ne� zlato?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Hmm, mrknu se. M�m tu tuhlecten prsten.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //P�ed lety jsem ho vyhr�l v jedn� zaplivan� p��stavn� kr�m�.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Tenkr�t ten chl�pek tvrdil, �e je magickej, ale nem�m tucha, jestli je to pravda.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Cht�l bys ho m�sto pen�z?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dej mi pen�ze.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dej mi prsten.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Dej mi ten prsten.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Tum�.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Dej mi pen�ze.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Fajn.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "M� n�co na prodej?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Nem� n�co na prodej?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Jestli chce� vobchodovat, zajdi za Garettem, ten se n�m star� vo z�soby.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "M� mi pr� pomoci.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //M� mi pomoct.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //S ��m?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Ka�on �ek�.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Vid�m, �e sis vzal je�t� p�r chlap�, v�born�! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Rad�i si s sebou vem je�t� p�r chlap�!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Ten ka�on je pekeln� nebezpe�nej!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Poj� se mnou.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Poj� se mnou.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Po�kej, nap�ed se vr�t�me do ka�onu...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //Poj�me!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "U� t� nepot�ebuju.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //U� t� nepot�ebuju.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //No tak dob�e, sejdeme se v t�bo�e.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //To u� je dost daleko!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Jestli chce� j�t d�l, tak s n�ma nepo��tej!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Jestli chce� j�t d�l, tak se mnou nepo��tej!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Jestli se n�jak ztrat�me, sejdem se tady.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Tak poj�me!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Sk�eti! Nesn��m sk�ety!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Nejsp� u� jsme zlikvidovali v�ecky b�itovce.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Ale jestli chce�, m��em tu je�t� chv�li pob�hat.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Pokud z�stanem v ka�onu. 
	
	AI_StopProcessInfos (self); 
};


