///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Maleth_EXIT   (C_INFO)
{
	npc         = BAU_954_Maleth;
	nr          = 999;
	condition   = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent   = TRUE;
	description = "Mus�m j�t!";
};
FUNC INT DIA_Maleth_EXIT_Condition()
{
	if (Kapitel	< 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc		(YWolf,	"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Hallo (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_Hallo_Condition;
	information	= DIA_Maleth_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

func int DIA_Maleth_Hallo_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Maleth_Hallo_08_00"); //Hej, cizin�e!

	if (hero.guild == GIL_NONE)
		{
		
			if (Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_01"); //Vid�l jsem t� p�ich�zet z hor.
			};
			AI_Output (self, other, "DIA_Maleth_Hallo_08_02"); //M��e� b�t r�d, �es nep�i�el p�ed t�emi t�dny.
			AI_Output (self, other, "DIA_Maleth_Hallo_08_03"); //Zatkli bychom t� jako uprchl�ho trestance. A ud�lali bychom s tebou kr�tk� proces!
			
			if (Npc_HasEquippedArmor(other) == FALSE) 
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_04"); //Vypad� �pln� vy�erpan�.
			}
			else
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_05"); //Kdy� jsi p�i�el, vypadal jsi, �e vypust� du�i.
				AI_Output (self, other, "DIA_Maleth_Hallo_08_06"); //Fajn, te� u� vypad� skoro jako �lov�k!
			};
		};

	AI_Output (self, other, "DIA_Maleth_Hallo_08_07"); //(ned�v��iv�) Co tady chce�?
};

///////////////////////////////////////////////////////////////////////
//	Banditen �berfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS		(C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BANDITS_Condition;
	information	= DIA_Maleth_BANDITS_Info;
	permanent   = FALSE;
	description	= "V hor�ch m� p�epadli bandit�.";
};

func int DIA_Maleth_BANDITS_Condition ()
{
	if (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BANDITS_15_00"); //V hor�ch m� p�epadli bandit�.
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_01"); //Ti zatracen� mizerov�! Mo�n� to budou ti, kte�� mi minulou noc ukradli jednu z ovc�!
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_02"); //M�ls obrovsk� �t�st�. V�t�ina lid� se odtamtud nedostala �iv�.
};

///////////////////////////////////////////////////////////////////////
//	Banditen tot
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsDEAD	(C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsDEAD_Condition;
	information	= DIA_Maleth_BanditsDEAD_Info;
	permanent   = FALSE;
	description	= "Ti bandit� u� v�m nebudou d�lat ��dn� probl�my.";
};

func int DIA_Maleth_BanditsDEAD_Condition ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_00"); //Ti bandit� u� v�m nebudou d�lat ��dn� probl�my.
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_01"); //Pro�? Jsou mrtv�?
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_02"); //Vyt�hli zbra� na �patn�ho chlapa.
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_03"); //D�ky Innosovi! Tady - nen� to sice moc, ale chci, aby sis to vzal!
	B_GiveInvItems (self, other, ItFo_Wine, 3);
	
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_MalethKillBandits);
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_04"); //�eknu o tom ostatn�m!
};

///////////////////////////////////////////////////////////////////////
//	Banditen leben noch
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsALIVE (C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsALIVE_Condition;
	information	= DIA_Maleth_BanditsALIVE_Info;
	permanent   = FALSE;
	description	= "V�m, kde maj� bandit� skr��.";
};

func int DIA_Maleth_BanditsALIVE_Condition ()
{
	var C_NPC b13; b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	
	if ( (!Npc_IsDead (b13)) || (!Npc_IsDead (b14)) || (!Npc_IsDead (b15)) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	&& (MIS_Maleth_Bandits != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsALIVE_15_00"); //V�m, kde maj� bandit� skr��.
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_01"); //Chce� na n� j�t? Tak z toho m� vynech! Je to moc nebezpe�n�!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_02"); //A krom� toho, mus�m d�vat pozor na ovce!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_03"); //Ale jestli si mysl�, �e n�s t� l�zy m��e� zbavit, bude ti cel� farma vd��n�.
	MIS_Maleth_Bandits = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Maleth,LOG_RUNNING);
	B_LogEntry (TOPIC_Maleth,"Jestli se mi poda�� pob�t bandity na cest� z Xardasovy v�e na Lobart�v statek, jeho obyvatel� mi budou velmi vd��n�.");
	
};


///////////////////////////////////////////////////////////////////////
//	Auf dem Weg in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_ToTheCity (C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 2;
	condition	= DIA_Maleth_ToTheCity_Condition;
	information	= DIA_Maleth_ToTheCity_Info;
	permanent   = FALSE;
	description	= "Jsem na cest� do m�sta.";
};

func int DIA_Maleth_ToTheCity_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_00"); //Jsem na cest� do m�sta.
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_01"); //Asi bude� muset podplatit str�e, aby ses dostal, kam chce�.
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_02"); //A taky mus� v�d�t, co cht�j� sly�et.
	}
	else
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_03"); //M��ou t� pustit dovnit� - kdy� jim �ekne�, co cht�j sly�et.
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_04"); //A to jako?
	AI_Output (self, other, "DIA_Maleth_ToTheCity_08_05"); //T�eba... �e jsi z Lobartovy farmy a pot�ebuje� za m�stsk�m kov��em.
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Kdy� str��m u m�stsk�ch bran �eknu, �e p�ich�z�m z Lobartova statku a �e m�m nam��eno ke kov��i, pust� m� dovnit�.");
	
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_06"); //Ale asi ti to nebude moc platn�. Nevypad� jako farm��.
		B_LogEntry (TOPIC_City,"Samoz�ejm� �e nap�ed mus�m vypadat taky jako sedl�k.");
		
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_07"); //Aha.
};
	
	
	

///////////////////////////////////////////////////////////////////////
//	Bessere Ausr�stung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_Equipment_Condition;
	information	= DIA_Maleth_Equipment_Info;
	permanent   = FALSE;
	description	= "Pot�ebuju lep�� vybaven�!";
};

func int DIA_Maleth_Equipment_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Maleth_Equipment_15_00"); //Pot�ebuju lep�� vybaven�!
	AI_Output (self, other, "DIA_Maleth_Equipment_08_01"); //To ch�pu. Ale �eknu ti rovnou: Nem�me nic, co bychom mohli postr�dat!
	if (!Npc_IsDead(Lobart))
	{
		AI_Output (self, other, "DIA_Maleth_Equipment_08_02"); //Pokud m��e� zaplatit za to, co chce�, Lobart ti n�co prod�.
		AI_Output (self, other, "DIA_Maleth_Equipment_08_03"); //Jinak se ho tak� m��e� zeptat, jestli by pro tebe nem�l n�jakou pr�ci.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Lobart
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_LOBART		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_LOBART_Condition;
	information	= DIA_Maleth_LOBART_Info;
	permanent   = FALSE;
	description	= "Kde m��u naj�t Lobarta?";
};

func int DIA_Maleth_LOBART_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Equipment))
	&& (!Npc_IsDead(Lobart))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info ()
{
	AI_Output (other, self, "DIA_Maleth_LOBART_15_00"); //Kde m��u naj�t Lobarta?
	AI_Output (self, other, "DIA_Maleth_LOBART_08_01"); //No, na farm� p�ece! Pat�� mu to tady!
	AI_Output (self, other, "DIA_Maleth_LOBART_08_02"); //A nezkou�ej si s n�m n�co za��nat! U� hodn� tul�k� od n�j dostalo nakl�da�ku a pak let�li z farmy.
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

INSTANCE DIA_Maleth_KAP3_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP3_EXIT_Condition;
	information	= DIA_Maleth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info probleme
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PROBLEME		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	30;
	condition	 = 	DIA_Maleth_PROBLEME_Condition;
	information	 = 	DIA_Maleth_PROBLEME_Info;

	description	 = 	"N�jak� zm�ny posledn� dobou?";
};

func int DIA_Maleth_PROBLEME_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_PROBLEME_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_15_00"); //N�jak� zm�ny posledn� dobou?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_01"); //Sejdi dol� po cest� k m�stu a uvid�.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_02"); //A� se potk� s �ernokab�tn�ky, pak uvid�, co je nov�ho.
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Jak se maj� ovce?", DIA_Maleth_PROBLEME_schafe );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "U� t� ty �ern� k�p� nav�t�vily?", DIA_Maleth_PROBLEME_beidir );
	
};
func void DIA_Maleth_PROBLEME_beidir ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //U� t� ty �ern� k�p� nav�t�vily?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //Jo. Z�staly tu n�kolik dn�. Jestli to chce� v�d�t, tak p�i�ly rovnou z pekel.

};

func void DIA_Maleth_PROBLEME_schafe ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //Jak se maj� ovce?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //(vztekle) Jako by t� to v�bec zaj�malo. M� jin� probl�my.
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Probl�my? Co ty o tom v�?", DIA_Maleth_PROBLEME_schafe_probleme );

};
func void DIA_Maleth_PROBLEME_schafe_probleme ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //Probl�my? Co ty o tom v�?
	
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //(stroze) Pat�� k m�stsk�m str��m, ne? Tak s t�ma bastardama v �ern�ch k�p�ch n�co ud�lej.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //(vztekle) Vy zatracen� �old�ci mysl�te jen na jedinou v�c: jak z ostatn�ch dostat co nejv�c pen�z do vlastn� kapsy.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //V� vzne�en� p�n kl�tera by m�l s t�mi postavami v k�p�ch n�co d�lat.
		};

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Hej, d�vej si bacha na pusu, k�mo.", DIA_Maleth_PROBLEME_schafe_probleme_drohen );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Info_AddChoice	(DIA_Maleth_PROBLEME, "Co m� za probl�m?", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag );
		};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //Co m� za probl�m?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //Ur�it� za to m��e ta �ern� p�lenka, co mi Vino p�ed n�kolika t�dny podstr�il.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //Nem��u si na nic vzpomenout, chlape. Jenom v�m, �e se mi ztratila moje vych�zkov� h�l.
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //A kv�li tomu d�l� takovej krav�l?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //Tob� se to �ekne, tvoje nebyla.
	
	Log_CreateTopic (TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry (TOPIC_MalethsGehstock,"Maleth se n�kde o�ral jak d�lo a ztratil p�itom vych�zkovou h�l. Jak ho zn�m, nikdy se z Lobartova statku moc nevzd�lil. Proto by se ta h�l m�la v�let n�kde pobl�."); 

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //Hej, d�vej si bacha na pusu, k�mo.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //Jedin�, co ti jde, jsou �e�i. Nejl�p ud�l�, kdy� p�jde� pry�.
};

func void DIA_Maleth_PROBLEME_Back ()
{
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

///////////////////////////////////////////////////////////////////////
//	Info Gehstock
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_GEHSTOCK		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_GEHSTOCK_Condition;
	information	 = 	DIA_Maleth_GEHSTOCK_Info;

	description	 = 	"M�m dojem, �e tahle h�l pat�� tob�.";
};

func int DIA_Maleth_GEHSTOCK_Condition ()
{
	if (Npc_HasItems (other,ItMw_MalethsGehstock_MIS))
	&& (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
		{
				return TRUE;
		};
};

func void DIA_Maleth_GEHSTOCK_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //M�m dojem, �e tahle h�l pat�� tob�.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //To je ohromn�. J�...
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //Tak moment. Nejd��v za ni zapla�.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //Ale... Moc toho nem�m.
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //V tom p��pad� na ni zapome�.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //DObr�. A co tohle? V�era jsem tu vid�l b�et n�jak� bandity s n�kolika m�ci zlata.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //Kdy� ti �eknu, kam schovali svou ko�ist, vr�t� mi za to moji h�l?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP (XP_FoundMalethsGehstock);

	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Promi�, ale to m� nezaj�m�. Chci zlato.", DIA_Maleth_GEHSTOCK_gold );
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Dobr�.", DIA_Maleth_GEHSTOCK_ok );
};
func void DIA_Maleth_GEHSTOCK_ok ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //Dobr�.
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //Fajn. Jdi odsud na z�pad k tamtomu kousku lesa. Najde� tam str�.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //V t� jeskyni ur�it� n�co bude.

	B_LogEntry (TOPIC_MalethsGehstock,"Maleth mi vypr�v�l, �e v les�ch z�padn� od Lobartova statku se nach�z� t�bor bandit�."); 
	CreateInvItems 		(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos (self);
};

func void DIA_Maleth_GEHSTOCK_gold ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //Promi�, ale to m� nezaj�m�. Chci zlato.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //Tady je v�echno, co m�m. M�lo by to sta�it.
	CreateInvItems 		(self, Itmi_Gold, 35);
	B_GiveInvItems 		(self, other, Itmi_Gold,35);
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PERM3		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_PERM3_Condition;
	information	 = 	DIA_Maleth_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nenech se v�bec ru�it.";
};

func int DIA_Maleth_PERM3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
	&& (Kapitel >= 3)
			{
					return TRUE;
			};
};

func void DIA_Maleth_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PERM3_15_00"); //Nenech se v�bec ru�it.
	AI_Output			(self, other, "DIA_Maleth_PERM3_08_01"); //(roz�ilen�) Zmizni.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Maleth_KAP4_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP4_EXIT_Condition;
	information	= DIA_Maleth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Maleth_KAP5_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP5_EXIT_Condition;
	information	= DIA_Maleth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP5_EXIT_Info()
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


INSTANCE DIA_Maleth_KAP6_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP6_EXIT_Condition;
	information	= DIA_Maleth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maleth_PICKPOCKET (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 900;
	condition	= DIA_Maleth_PICKPOCKET_Condition;
	information	= DIA_Maleth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Maleth_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Maleth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maleth_PICKPOCKET);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_BACK 		,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};
	
func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};






































































