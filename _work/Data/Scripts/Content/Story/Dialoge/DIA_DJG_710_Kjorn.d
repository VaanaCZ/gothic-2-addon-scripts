
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kjorn_EXIT   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 999;
	condition   = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Kjorn_Hello   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;	
};

FUNC INT DIA_Kjorn_Hello_Condition()
{
	IF (Npc_GetDistToNpc (self,hero) < 300)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_Hello_Info()
{
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Hej, poj� sem!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Co chce�?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Tohle �dol� je nebezpe�n� m�sto a bez po��dn�ho vybaven� bude� mrtvej, ani se nenad�je�.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //P�edpokl�d�m, �e to po��dn� vybaven� najdu u TEBE.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //To se vsa�. Dokonce ti ho m��u prodat.
};

//*********************************************************************
//	Info TRADE 
//*********************************************************************
INSTANCE DIA_Kjorn_TRADE   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	Trade		= TRUE;
	permanent   = TRUE;
	description	= "Co mi m��e� nab�dnout?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Co mi m��e� nab�dnout?

};

//*********************************************************************
//	Verkaufst du auch Informationen? 
//*********************************************************************
INSTANCE DIA_Kjorn_SellInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent   = FALSE;
	description	= "Prod�v� taky informace?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Prod�v� taky informace?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //P�ijde na to. Pokud je dobr� cena, �eknu v�echno, co v�m.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Kolik?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hmm... t�ko ��ct. Ale mysl�m, �e 50 zlat�ch za ka�dou poskytnutou informaci je docela dobr� cena.
};

//*********************************************************************
//	Ich brauche Infos �ber.. 
//*********************************************************************
INSTANCE DIA_Kjorn_BuyInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent   = TRUE;
	description	= "Pot�ebuju n�jak� informace.";
				
};

FUNC INT DIA_Kjorn_BuyInfos_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //Pot�ebuju n�jak� informace.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 zlat�ch!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"To je pro m� moc drah�.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Ano, tady.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //To je pro m� moc drah�.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Ano, tady.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //A te� mi �ekni...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zur�ck -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o drac�ch.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...je�t� n�co o drac�ch.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o Hornick�m �dol�.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...je�t� n�co o Hornick�m �dol�.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o hradu.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...o sk�etech.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"...je�t� n�co o sk�etech.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zur�ck -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //V�, rozmyslel jsem si to. Vra� mi moje pen�ze.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Jak je libo.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //�ekni mi n�co o drac�ch.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Draci jsou prad�vn�, neuv��iteln� mocn� stvo�en�. Kdysi jich �ily tis�ce po cel�m sv�t�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Ale u� je to p�es sto let, co n�kter�ho z nich n�kdo vid�l.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Jejich krev je hork� jako vrouc� olej. Kdy� se ti pod�vaj� do o��, prom�n� se tv� srdce v k�men. Tak jsem to alespo� sly�el.
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //�ekni mi o t�ch drac�ch v�c.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Ale ne v�ichni draci jsou takov�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //N�kte�� z nich m��ou celou zem pokr�t vrstvou ledu n�kolik stop tlustou.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //Jin� d�vaj� p�ednost �ivotu v ba�in�ch nebo v sope�n�ch kr�terech.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Drakobijce Kjorn se domn�v�, �e drak� je n�kolik druh�. N�kte�� si potrp� na chlad a vlhko, jin� zase d�vaj� p�ednost ohni."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //�ekni mi n�co o Hornick�m �dol�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //Hornick� �dol� v Khorinidu je d�ky magick� rud� zn�m� po cel� zemi.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //Tyhle hory jsou jedin�m m�stem na sv�t�, kde se magick� ruda vyskytuje.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Zbran� vyroben� z t�hle rudy jsou prakticky nezni�iteln� a proniknou i t�m nejlep��m brn�n�m.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Je�t� p�ed n�kolika t�dny cel� �dol� obklopovala magick� bari�ra. Byla neproniknuteln�, a tak se nikdo nemohl dostat ven.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //�ekni mi o tom �dol� v�c.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //�dol� se b�hem t�ch n�kolika m�lo dn� zm�nilo k nepozn�n�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Kdy� p�i�li sk�eti, uk�zaly se i dal�� stv�ry. Nic podobn�ho tu nikdo nikdy p�edt�m nevid�l.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //��k� se, �e tu je�t� po��d z�stalo n�kolik osam�l�ch lovc�, ale nejsem si zrovna jist�, jestli taky z�stali na�ivu.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //Vypad� to, jako by se do toho �dol� stahovala v�echna Beliarova stvo�en� temnot.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //�ekni mi n�co o hrad�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Le�� t�m�� uprost�ed Hornick�ho �dol�.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //D��v, kdy� to �dol� je�t� slou�ilo jako v�zen�, m�li ve�kerou rudu odtamtud pod palcem rudobaroni.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //�ekni mi n�co o sk�etech.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Ti sk�eti tu nejsou moc dlouho. Alespo� ne ti, co jsou te� p�ed hradem.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Ale nejde mi na rozum, �e jsou tak dob�e organizovan�. Sk�eti v�t�inou �to�� hlava nehlava a je jim jedno na co.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Tihle �ekaj� na ten spr�vn� �as. �ekaj�, ale my nev�me na co.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //�ekni mi o t�ch sk�etech v�c.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Ti sk�eti jsou pod velen�m elitn�ch v�le�n�k�. Maj� obrovskou s�lu a disponuj� v�born�mi zbrojemi. Je t�m�� nemo�n� je porazit.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Jednou jsem vid�l, jak jeden z nich slo�il vzrostl� dub jedin�m m�chnut�m sekery.
	
	KjornToldOrks = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kjorn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Zabil jsem v�echny draky!";
				
};

FUNC INT DIA_Kjorn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //Zabil jsem v�echny draky!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(sm�ch) Jasn�, a j� jsem paladin.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Mo�n� se ti poda�ilo zab�t jednoho, ale v�echny? Najdi si n�koho jin�ho, kdo bude ochoten ti v��it.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kjorn_PICKPOCKET (C_INFO)
{
	npc			= DJG_710_Kjorn;
	nr			= 900;
	condition	= DIA_Kjorn_PICKPOCKET_Condition;
	information	= DIA_Kjorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kjorn_PICKPOCKET_Condition()
{
	C_Beklauen (47, 75);
};
 
FUNC VOID DIA_Kjorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_BACK 		,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};
	
func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};


