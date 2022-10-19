// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Buster_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_EXIT_Condition;
	information	= DIA_Buster_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Buster_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Buster_Hello (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_Hello_Condition;
	information	= DIA_Buster_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Buster_Hello_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) //Wegen News - Info kommt nicht mehr gut, wenn schonmal gepr�gelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Kohopak to tady m�me? Nezn�m t� odn�kud?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Kdy� mysl�. Jsem na cest� za statk��em." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "Kdo se pt�?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //Kdo se pt�?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Jsem Buster, jeden z Leeov�ch �oldn���!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //A TY bys ke mn� m�l b�t tro�ku zdvo�ilej��, nebo toho bude� litovat!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Dobr�, co tady chce�?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Do toho ti nic nen�."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Leeho zn�m!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Jsem pouh�m poutn�kem, kter� by si r�d promluvil se statk��em." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Leeho zn�m!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Leeho zn� ka�d�! To nic neznamen�, k�mo. Zrovna te� mluv� SE MNOU!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Tak�e, kam m� nam��eno?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Do toho ti nic nen�."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Jsem pouh�m poutn�kem, kter� by si r�d promluvil s hostinsk�m." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Do toho ti nic nen�.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Takhle se mnou nikdo mluvit nebude, ty �erve! �ekl bych, �e je �as na po��dnou nakl�da�ku.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Kdy� mysl�. Jsem na cest� za statk��em.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //V�n�... Hm - nep�ijde� mi n�jak zvl�� nebezpe�n�.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chce� to zjistit?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Jednou nebo dvakr�t jsem zabil n�jakou p��eru."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "To m� pravdu." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //To m� pravdu.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //(samolib�) Jo, za ty roky se nau�� si takov�ch v�c� v��mat, k�mo.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //V jednom kuse tady bojujeme se sk�etama. Nebo str�ema z m�sta. Teda, jsou to p�kn� neodbytn� prev�ti, to teda jo. (zasm�je se)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Mysl� SKUTE�N� sk�ety? Ty velk� potvory?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Tak�e?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "P�sobiv�." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Jednou nebo dvakr�t jsem zabil n�jakou p��eru.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ha! (zasm�je se) Nejsp� jsi v poli roz�l�pnul p�r brouk� a vyhnal n�kolik krys z jejich nor.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Tady n�m jdou po krku sk�eti! Jo, a ta mizern� m�stsk� str�. (v�sm�n� se zasm�je)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Mysl� SKUTE�N� sk�ety? Ty velk� potvory?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Tak�e?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "P�sobiv�." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Chce� se p�esv�d�it
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Bo���ku! Vybral jsem si �patn�ho otlouk�nka, co?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Dalo by se to tak ��ct.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //Tak poj�, uka� mi, co v tob� je.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //P�sobiv�.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //(zasm�je se) To je na�e �ivnost, chlap�e! Dokonce si d�l�me vlastn� zbran� a brn�n�!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Vysm�v�me se smrti den co den. Ale o n��em takov�m nem� vesnick� bal�k jako ty ani zd�n�.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Asi ti budu muset uk�zat, jak velk� pon�t� o tom m�m!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Kdy� to ��k�..."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Kdy� to ��k�...
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //(se znud�n�m zavr�en�m) Mazej, stra�pytle!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Asi ti budu muset uk�zat, jak velk� pon�t� o tom m�m!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //To m� b�t jednomu�n� rolnick� povst�n�, nebo co?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Tak dobr�, uka� mi, co v tob� je.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Tak�e?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //(odfrkne si) Jako bys v�d�l, o �em to tady mluv�m. Mysl� si, b�hv�jak nejsi siln�, co?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //(rozzloben�) Mo�n� je na�ase, aby ti n�kdo u�t�d�il lekci!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Kdykoliv!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "D�l�m si srandu..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Mysl� SKUTE�N� sk�ety? Ty velk� potvory?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //(povzdychne si) J� jenom... Po�kat! Chce� si ze m� utahovat?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //(s �sm�vem) To v�bec ne.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Ty �erve! (ne�ekan� agresivn�) Ned� jinak, co?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //Tak poj� a uka�, co v tob� je, ty hrdino!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Kdykoliv!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "D�l�m si srandu..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //Kdykoliv!
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //Tak poj� bl�, k�mo!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //D�l�m si srandu.
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //No jo, jasn�, zastr� dr�pky! Jdi mi z o��!
	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				 FightNone
// ************************************************************

INSTANCE DIA_Buster_FightNone (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_FightNone_Condition;
	information	= DIA_Buster_FightNone_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Buster_FightNone_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Buster_Hello))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Co chce�, stra�pytle?
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************

INSTANCE DIA_Buster_Duell (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 3;
	condition	= DIA_Buster_Duell_Condition;
	information	= DIA_Buster_Duell_Info;
	permanent	= TRUE;
	description = "Vyz�v�m t� k souboji!";
};                       

FUNC INT DIA_Buster_Duell_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Duell_Info()
{	
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Vyz�v�m t� k souboji!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ha, ha! Nechce� to nechat jen tak, co? Tak dobr� - poj� sem!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Chce� to zkusit znovu? Otravo mizernej - dobr�, poj� sem!
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //Ale u� podruh� neut�kej!
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************
INSTANCE DIA_Buster_WannaJoin (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WannaJoin_Condition;
	information	= DIA_Buster_WannaJoin_Info;
	permanent	= TRUE;
	description = "Chci se p�idat k �oldn���m!";
};                       

FUNC INT DIA_Buster_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Buster_Duell == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WannaJoin_Info()
{	
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Chci se p�idat k �oldn���m!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Ka�d�, kdo m� r�nu tvrdou jako ty, by tady nem�l m�t ��dn� probl�my.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Nejsi zrovna nejlep�� bojovn�k, ale odvaha ti rozhodn� nechyb�.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //M�j hlas tady moc neznamen�, proto�e jsem tady dlouho nebyl, ale a� se m� Lee zept�, budu hlasovat pro tebe.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Te�, kdy� jsem Bustera porazil, u� nem� nic proti tomu, abych se p�idal k �old�k�m.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Ty? Nevzpom�n�m si, �e by k �oldn���m kdy p�ijali n�jak�ho sraba.
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Ut�kat ze souboje - s t�m se tady moc daleko nedostane�!
		};
	};
};

// ************************************************************
// 		  				 Mehr �ber S�ldner		
// ************************************************************
var int Buster_SentenzaTip;

INSTANCE DIA_Buster_OtherSld (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_OtherSld_Condition;
	information	= DIA_Buster_OtherSld_Info;
	permanent	= FALSE;
	description = "R�d bych se dozv�d�l n�co o �oldn���ch a zdej��m okol�.";
};                       

FUNC INT DIA_Buster_OtherSld_Condition()
{
	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
		{
				return TRUE;	
		};
};
 
FUNC VOID DIA_Buster_OtherSld_Info()
{	
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //R�d bych se dozv�d�l n�co o �oldn���ch a zdej��m okol�.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //O okol� ti toho moc nepov�m. Na to by ses m�l rad�ji zeptat farm���.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //A co se t��e n�s �oldn��� - m�me jedno velice jednoduch� pravidlo: jestli dok�e� neustoupit, m��e� mezi n�s.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Mysl�m, �e jsi p�esn� z toho materi�lu, kter� pot�ebujeme.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Ale ne, aby ti to stouplo do hlavy, �e jsi m�l v na�em posledn�m souboji �t�st�.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Na farm� je spousta hoch�, kte�� jsou o chloupek lep�� ne� j�.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Sentenza, nap��klad. Hl�d� vstup na farmu. A� se d�je, co se d�je, s n�m se do k��ku nepou�t�j.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Ale pro� to vlastn� ��k�m takov�mu zbab�lci!
		AI_StopProcessInfos (self);		
	};
};

// ************************************************************
// 		  				About Sentenza		
// ************************************************************
var int Buster_GoldZumBrennen;
var int Buster_Bonus;

INSTANCE DIA_Buster_AboutSentenza (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_AboutSentenza_Condition;
	information	= DIA_Buster_AboutSentenza_Info;
	permanent	= FALSE;
	description = "Co s t�m Sentenzou?";
};                       

FUNC INT DIA_Buster_AboutSentenza_Condition()
{
	if (Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_AboutSentenza_Info()
{	
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //Co s t�m Sentenzou?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //A� p�ijde� na farmu, pokus� se z tebe vym��knout n�jak� pen�ze - to d�l� v�em nov��k�m.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //A b�t na tv�m m�st�, tak bych zaplatil. S�m jsem to sv�ho �asu ud�lal. Dobr� bylo, �e mi pak dal sv�j hlas.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //��k�, �e jedna laskavost vy�aduje druhou. Tenkr�t jsem tak p�i�el o v�echny sv� pen�ze, ale nebylo to vlastn� a� tak moc. A nakonec jsem byl r�d, �e to tak dopadlo.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Ve chv�li, kdy� jsem vid�l, jak zml�til man�ka, kter� se rozhodl NEZAPLATIT.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //D�ky za radu.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //R�do se stalo. M� pro tebe n�jakou cenu?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Ne.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Tady m� - 5 zlat�ch.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Tady m� - 5 zlat�ch.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //D�ky, chlape. Zd� se, �e si ve�er budu moc d�t p�r korbel�. Na to nezapomenu.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Ne.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Myslel jsem si to.
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

// ************************************************************
// 		  				 LeeLeader		
// ************************************************************

INSTANCE DIA_Buster_LeeLeader (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_LeeLeader_Condition;
	information	= DIA_Buster_LeeLeader_Info;
	permanent	= FALSE;
	description = "Lee je ��f �oldn���, ne?";
};                       

FUNC INT DIA_Buster_LeeLeader_Condition()
{
	if (Buster_Duell == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_LeeLeader_Info()
{	
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee je ��f �oldn���, ne?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //P�esn� tak - hej, u� jsem si vzpomn�l, odkud t� zn�m! Tys byl tak� v kolonii.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //(s povzdychem) To jsem byl.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Nevid�l jsem t�, kdy� do�lo k tomu velk�mu t�esku. Ani hodnou chv�li p�edt�m.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //M�l jsem jin� starosti.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Tos o hodn� p�i�el - co jsme byli v lochu, tak se dost v�c� zm�nilo.
};


// ************************************************************
// 		  				 WhatHappened		
// ************************************************************

INSTANCE DIA_Buster_WhatHappened (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WhatHappened_Condition;
	information	= DIA_Buster_WhatHappened_Info;
	permanent	= FALSE;
	description = "Co se stalo se �oldn��i v kolonii?";
};                       

FUNC INT DIA_Buster_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Buster_LeeLeader))
	&& ((hero.guild != GIL_SLD)&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WhatHappened_Info()
{	
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Co se stalo se �oldn��i v kolonii?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Jakmile bari�ra padla, vyvedl n�s Lee z kolonie. ��kal, �e kdy� budeme dr�et pohromad�, tak se n�m nic nestane. A m�l pravdu.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Netrvalo dlouho a na�li jsme si tady hezk� m�ste�ko. Statk�� n�m plat�, abychom zametali s domobranou z m�sta.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //A v�t�ina z n�s by do toho �la dobrovoln� i zadarmo.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Ale Onar n�m d�v� j�dlo a aspo� tak m��eme n�jak zab�t �as, ne� se naskytne n�jak� p��le�itost pl�chnout z tohohle mizern�ho ostrova.
};


//**************************************
//			TrainingGold
//************************************** 
INSTANCE DIA_Buster_Teach (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 8;
	condition	= DIA_Buster_Teach_Condition;
	information	= DIA_Buster_Teach_Info;
	permanent	= TRUE;
	description = "M��e� m� nau�it, jak l�pe bojovat?";
};                       

FUNC INT DIA_Buster_Teach_Condition()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_1H) <= 60) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_Teach_Info()
{	
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //M��e� m� nau�it, jak l�pe bojovat?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Mo�n� bych ti mohl d�t jednu dv� rady.
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Nejsi tak tup�, jak vypad�. Dobr�, nau��m t�, co v�m. Pak mo�n� proti mn� bude� m�t n�jakou �anci.
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster m� nau��, jak bojovat jednoru�n�mi zbran�mi.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_Back ()
{
	Info_ClearChoices (DIA_Buster_Teach);
};

FUNC VOID DIA_Buster_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Buster_KAP3_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP3_EXIT_Condition;
	information	= DIA_Buster_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Shadowbeasts
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_SHADOWBEASTS		(C_INFO)
{
	npc		 	= Sld_802_Buster;
	nr		 	= 30;
	condition	= DIA_Buster_SHADOWBEASTS_Condition;
	information	= DIA_Buster_SHADOWBEASTS_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Buster_SHADOWBEASTS_Condition ()
{
	if ((Kapitel == 3) || (Kapitel == 4))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void B_DIA_Buster_SHADOWBEASTS_OK ()
{
	AI_StopProcessInfos (self);
};

func void DIA_Buster_SHADOWBEASTS_Info ()
{
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hej, ty, chlap�e!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Co chce�?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Posledn�ch p�r dn� jsem p�em��lel, jak v t�hle d��e p�ij�t k n�jak�m snadn�m pen�z�m.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //A?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Mysl�m, �e jsem p�i�el na to, jak n�jak� prachy z�skat.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Jeden kupec z m�sta vyklop� za jistou v�c p�knej bal�k.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Co je to za kupce, o kter�m mluv�?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "O co jde?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Pro� mi to ��k�?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Pro� mi to ��k�?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Nem��u do toho j�t s�m. Mus�m z�stat tady a d�vat pozor na ty pitom� ovce.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Mysl� farm��e.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //No v�dy�.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //O co jde?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Ten kupec tvrd�, �e by mohl na trhu velice dob�e zpen�it rohy st�nov� �elmy.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //N�kdo bude muset j�t do lesa a ty stv�ry pokosit. A to je pr�v� pr�ce pro tebe.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Kolik z toho kouk�?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Kolik z toho kouk�?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Bal�k pen�z, to ti pov�d�m. Bude dost pro n�s pro oba.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //A proto�e jsi mi tenkr�t p�inesl to zlato, ud�l�m ti zvl�tn� cenu.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //To zn� dob�e! D�m ti v�d�t, a� budu m�t n�jak� ty rohy.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster mi nab�dl dobrou cenu za ka�d� roh st�nov� �elmy, kter� mu p�inesu."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Co je to za kupce, o kter�m mluv�?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Tak to ne, k�mo. Byl bych v�n� pitomec, kdybych ti prozradil sv�j zdroj. Chce� m� snad podfouknout?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Bu� se dohodne� SE MNOU, nebo v�bec. Kapi�to?

};

///////////////////////////////////////////////////////////////////////
//	Info BringTrophyShadowbeast
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_BringTrophyShadowbeast		(C_INFO)
{
	npc		 = 	Sld_802_Buster;
	nr		 = 	2;
	condition	 = 	DIA_Buster_BringTrophyShadowbeast_Condition;
	information	 = 	DIA_Buster_BringTrophyShadowbeast_Info;
	permanent	 = 	TRUE;

	description	 = 	"K t�m roh�m st�nov� �elmy...";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition ()
{
	if (MIS_Buster_KillShadowbeasts_DJG == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItAt_ShadowHorn))||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info ()
{
	if ((Kapitel >= 5))
	{
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //M�j kupec n�m dal sbohem.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Co to m� znamenat?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Je mrtv�. Klidn� si ty rohy nech. Stejn� nev�m, co bych s nimi te� d�lal.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Jak m�m vykuchat st�novou �elmu?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Ty to nev�? Teda chlape, �ekal jsem od tebe v�c.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Pak se k tob� vr�t�m.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("U� m�.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
	}
	else 
	{
		var int BusterTrophyShadowbeastCount;
		var int XP_BringBusterTrophyShadowbeast;
		var int XP_BringBusterTrophyShadowbeasts;
		var int BustersBusterTrophyShadowbeastOffer;
		var int BusterTrophyShadowbeastGeld;
	
		BusterTrophyShadowbeastCount = Npc_HasItems(other, ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = 	(Shadowbeast.level * XP_PER_VICTORY);			
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus; //Joly: Wert ohne Handelmultiplier!!!!!!!!!!!!!
		
	
		if (BusterTrophyShadowbeastCount == 1)
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //M�m pro tebe roh st�nov� �elmy.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //M�m pro tv�ho kupce p�r dal��ch roh� st�nov� �elmy.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Skv�l�. Uka�. A p�ines jich v�c. Kdo v�, jak dlouho bude ten kupec tyhle v�ci je�t� cht�t.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Tady je tv�j pod�l.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //U� m�.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //Tak poslouchej. Zabije� st�novou �elmu a pak ji pravou rukou chyt� co nejpevn�ji za roh.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Potom zaraz� n�� do jej�ho �ela a kolem rohu vy��zne� �l�bek.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //N�� potom pou�ije� jako p�ku, roh odlom� a d� si ho do kapsy.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //No. A pak mi ho p�inese�. To by pro tebe nem�lo b�t a� tak t�k�.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Pak se k tob� vr�t�m.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //To douf�m.
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Buster_KAP4_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP4_EXIT_Condition;
	information	= DIA_Buster_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		  				 	PERM Kapitel 4	
// ************************************************************

INSTANCE DIA_Buster_Perm4 (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_Perm4_Condition;
	information	= DIA_Buster_Perm4_Info;
	permanent	= TRUE;
	description = "Co si mysl� o cel� t� drakobijeck� z�le�itosti?";
};                       

FUNC INT DIA_Buster_Perm4_Condition()
{
	if (Kapitel >= 4) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Perm4_Info()
{	
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Co si mysl� o cel� t� drakobijeck� z�le�itosti?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Ho�i by z toho mohli vyt��skat docela dost zlata - pokud d��v nezaklepou ba�korama.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //J� osobn� se rad�i dr��m Leeho.
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Buster_KAP5_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP5_EXIT_Condition;
	information	= DIA_Buster_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Buster_KAP6_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP6_EXIT_Condition;
	information	= DIA_Buster_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Buster_PICKPOCKET (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 900;
	condition	= DIA_Buster_PICKPOCKET_Condition;
	information	= DIA_Buster_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Buster_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Buster_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Buster_PICKPOCKET);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_BACK 		,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};
	
func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};








































