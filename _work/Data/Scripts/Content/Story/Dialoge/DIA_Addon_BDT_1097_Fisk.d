//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_EXIT   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 999;
	condition   = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fisk_PICKPOCKET (C_INFO)
{
	npc			= BDT_1097_Addon_Fisk;
	nr			= 900;
	condition	= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information	= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       
FUNC INT DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen (118, 300);
};
 
FUNC VOID DIA_Addon_Fisk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
	
func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Hi   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 1;
	condition   = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fisk_Hi_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hej, jestli tady v t�bo�e hled� ��k�ho slu�n�ho obchodn�ka, tak jsi ho pr�v� na�el.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//M�m chatr� p��mo za Estebanem, tak�e kdybys n�co pot�eboval, zastav se.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk prod�v� v�echno mo�n�.");
	
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine  (self,"START");
};
//--------------------------------------------------------------------
//	Info Trade
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Trade   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 888;
	condition   = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;

};
FUNC INT DIA_Addon_Fisk_Trade_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
	B_Say (other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	
	//Bolzen nachf�llen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachf�llen
	if (Npc_HasItems (self, ItRw_Arrow) < 50)
	{
		CreateInvItems (self,ItRw_Arrow, (50 - Npc_HasItems (self, ItRw_Arrow))); 
	};
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fisk_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Hele, j� s t�m nechci m�t nic spole�n�ho, kapi�to?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(nevinn�) M�m jin� starosti, j� s�m jsem ob��.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Jak to?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Za posledn� dod�vku jsem vysolil p�knou hromadu zlata.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ale nikdy jsem za ni nic nedostal! ��kej hajzl to prost� stopil!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(rozzu�en�) Okradli m�, a nejsp� n�kdo z na�ich vlastn�ch lid�!
};

//---------------------------------------------------------------------
//	Lieferung
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 3;
	condition   = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent   = FALSE;
	description	= "Co to bylo za dod�vku?";
};
FUNC INT DIA_Addon_Fisk_Lieferung_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Co to bylo za dod�vku?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Bal�k pakl���. N�kdo mi je m�l vyzvednout u pir�t�.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ale jistej Juan mi je �majznul. (vztekle) V�etn� zlata, kter� jsem za n� zaplatil!
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ten �mejd se te� ukrejv� n�kde v ba�in�.
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Jist� Juan obchodoval s bandity. Pr� se ukr�vaj� kdesi v ba�in�ch.");
	B_LogEntry (Topic_Addon_Fisk,"Jist� Juan ukradl Fiskovi z�silku zbo�� (bal�k pakl���). Te� se skr�v� kdesi v ba�in�ch.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Je mrtv�.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Dob�e, aspo� u� od n�j bude pokoj.
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Je st�le na�ivu.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Tys tu svini nechal ��t?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Nebyl s�m.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Nevad� � j� se s t�ma hajzlama vypo��d�m pozd�jc.
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //A co se t��e tebe...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //M�m fakt dobr� vztahy s Hunem.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Dohl�dnu, aby ti odte�ka prod�val brn�n� fakt levn�.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //A vem si tohle � tenhle �utr jsem jednou dostal od Corrista.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //Je to jedin� v�c, co p�e�ila m�j �t�k z bari�ry. Mysl�m, �e ho vyu�ije� v�c jak j�.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //A taky ti d�m jednu ze svejch zbran�.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h gr��er oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(uli�nicky) Ruka ruku myje � to se nikdy nezm�n�.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "M�m ten tv�j bal�k.";
};
FUNC INT DIA_Addon_Fisk_GivePaket_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Lennar_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //M�m ten tv�j bal�k.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(pot�en�) V�n�! (p�ekvapen�) A co Juan?
	
	B_Addon_Fisk_AboutJuan();
	
	B_Addon_Fisk_Belohnung();
};

//---------------------------------------------------------------------
//	Paket OPEN - 
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 5;
	condition   = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent   = FALSE;
	description = "Otev�el jsem tv�j bal�k!";
};
FUNC INT DIA_Addon_Fisk_PaketOpen_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Otev�el jsem ten tv�j bal�k!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(sm�je se) Samoz�ejm�! Ses prost� nemoh do�kat, co?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //M� aspo� je�t� ty pakl��e?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //A hlavn�, co je s Juanem?

	B_Addon_Fisk_AboutJuan();
};

//---------------------------------------------------------------------
//	- Dietriche abgeben! 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePicks (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 6;
	condition   = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent   = TRUE;
	description = "Tady m� tucet pakl���.";
};
FUNC INT DIA_Addon_Fisk_GivePicks_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Tady m� tucet pakl���.

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //V�born�. P�r lid� u� na tuhle dod�vku �ek� jak na smilov�n�.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //Tohle nen� tucet! (potuteln�) Chce� m� snad nap�lit?
	};
};


//---------------------------------------------------------------------
//	Inspektor
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Inspektor (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 7;
	condition   = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent   = FALSE;
	description = "Juan pracoval pro Estebana!";
};
FUNC INT DIA_Addon_Fisk_Inspektor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo (other, DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan pracoval pro Estebana!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(p�ekvapen�) Co�e?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Nehraj si se mnou! Tys o tom v�d�l!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(klidn�) No dob�e, m� pravdu. Ale douf�m, �e si taky uv�domuje�, pro� jsem ti to ne�ek.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //V�ichni v t�bo�e si mysl�, �e pracuje� pro Estebana.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //A j� se do t� z�le�itosti rozhodn� nechci namo�it jenom proto, �e se� celej �havej, jen aby ti dal �ervenej k�men.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"J� vlastn� nepracuju pro Estebana.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Nev���m ti!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"To je mi jasn�!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Ch�pu.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Fajn, tak to nechme bejt. Nikdo n�s nemus� sly�et!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Nev���m ti!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //V�� si, �emu chce�, ale varuju t�! Jestli o mn� chce� Estebanovi vypr�v�t ��k� poh�dky, pak bude� dal�� na �ad�!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //J� pro Estebana a� tak �pln� nepracuju.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Tak�e si s t�m star�m �mejdem jen tak zahr�v�?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Pak ti d�m dobrou radu: nech si to pro sebe.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Nev�� NIKOMU, kdo m� n�co spole�n�ho s Estebanem, ani mn�. Kapi�to?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //A te� u� toho nechme, a� n�s n�kdo nesly��.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

//--------------------------------------------------------------------
//	Info Meeting
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Meeting   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent   = FALSE;
	description = "Tak�e ten �tok jsi sp�skal TY!";
};
FUNC INT DIA_Addon_Fisk_Meeting_Condition()
{	
	if (Npc_GetDistToWP  (self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//Tak�e ten �tok jsi sp�skal TY.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Jo. Esteban mi kaz� k�efty.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Nikoho z lid�, co pro m� pracujou, nechce pustit do dol�. D�v� si bacha, aby V�ICHNI makali pro n�j a jedin� pro n�j.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Proto m��e vyb�rat poplatek z ka�d�ho obchodu. Ovl�d� celej t�bor.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Co m� v pl�nu?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Chce� zaujmout jeho m�sto?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Taky bych t� mohl Estebanovi prodat.",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//A ty ho chce� nahradit?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Ne, j� jsem kupec � jen si chci v klidu hled�t sv�ho.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Mohl bych t� Estebanovi prodat.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//A co? Co si mysl�, �e se pak stane? Mysl�, �e ti d�, co chce�?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Zapome� na to � m�m lep�� pl�n.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Co m� v pl�nu?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Odstran�me Estebana � to znamen�, �e TY ho zabije� a p�evezme� jeho m�sto.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Kdy� s n�m budou ty jeho gorily, nem�m �anci.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Pak je mus�me p�im�t, k odchodu � pov�me jim pravdu.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Jakou pravdu?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//�es ud�lal, co ti nak�zal, a �e ten �tok jsem sp�skal j�.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Pov�z to Estebanovi a on po�le sv� hochy, aby m� zabili. A j� si tu na n� po�k�m.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//A� budou pry�, m��e� toho bastarda v klidu sejmout a j� se zat�m postar�m o jeho str�e.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban je mrtv�. U� se zase m��u v�novat jenom obchod�m.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Tum�, tohle je pro tebe.
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Ten �tok na Estebana napl�noval Fisk.");
};
//--------------------------------------------------------------------
//	Info Sieg
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Sieg   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent   = FALSE;
	description = "Esteban u� to m� za sebou.";
};
FUNC INT DIA_Addon_Fisk_Sieg_Condition()
{	
	if (MIS_Judas == LOG_SUCCESS)
	&&  Npc_IsDead (Esteban)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban u� to m� za sebou.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Na tohle jsem �ekal jak dlouho.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Mysl�m, �e te� m� na pr�ci dal�� v�ci a j� se mus�m vr�tit zp�tky k obchod�m.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Tak�e kdy� bude� pot�ebovat n�co dal��ho, v�, kde m� naj�t.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

