// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_3_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_3_Fegen_Condition;
	information	= DIA_NOV_3_Fegen_Info;
	permanent	= TRUE;
	description = "Pot�ebuju pomoci zam�st pokoje novic�.";
};                       
//------------------------------------
var int Feger1_Permanent; 
var int Feger2_Permanent;
//------------------------------------
FUNC INT DIA_NOV_3_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Pot�ebuji pomoci zam�st pokoje novic�.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Nikdo ti nechce jen tak pomoct, co? Pom��u ti jen v p��pad�, �e se ti poda�� p�esv�d�it je�t� n�koho dal��ho, aby do toho �el taky.
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic, kter� ukl�z� sklep, mi nab�dl pomocnou ruku, pokud n�kter�ho z jeho bratr� p�esv�d��m, aby mu pomohl zam�st komnaty.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //To jsem jedin�, kdo je ochotn� ti pomoci?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Ne, u� se mi poda�ilo z�skat n�koho dal��ho.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //Tak to jsem pro.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic ze sklepa mi nyn� pom��e uklidit komnaty.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Hej, brat�e - j� u� ti p�ece pom�h�m. Nemus� m� p�emlouvat.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Jasn� �e ti pom��u. My novicov� mus�me dr�et p�i sob�. Ruka ruku myje.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Pot�ebuju 50 zlat�ch, proto�e jsem st�le je�t� nezaplatil Parlanovi.
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic p�ed kostelem mi pom��e, pokud mu zaplat�m pades�t zla��k�.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Mo�n� pozd�ji.",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"Dobr�. Zaplat�m.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //V�ak u� jsem ti to sl�bil. Tys pomohl mn�, j� pom��u tob�.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Zapome� na to - nem�m na takov� v�ci �as. Pod�vej se po n�kom jin�m, kdo by ti mohl pomoct.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Mo�n� pozd�ji. Pr�v� te� si to nem��u dovolit.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //Dobr�. Zaplat�m.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Fajn, v tom p��pad� m��u za��t.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Novic p�ed kostelem mi nyn� pom��e s �klidem komnat.");
	
	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_3_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_3_Wurst_Condition;
	information	= DIA_NOV_3_Wurst_Info;
	permanent	= TRUE;
	description = "Nedal by sis klob�su?";
};                       

FUNC INT DIA_NOV_3_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Nedal by sis klob�su?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Jasn�, dej to sem. Takov� klob�sa nen� v�bec k zahozen�.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "Chci se st�t m�gem!";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Chci se st�t m�gem!
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //To chce ka�d� novic. Ale jen n�kolika z nich je po�ehn�no b�t vyvolen�m a dostat �anci na p�ijet� do kruhu ohn�.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //B�t m�gem kruhu ohn� je tou nejvy��� poctou, jak� se ti u n�s m��e dostat.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Bude� muset tvrd� pracovat, abys dostal svou �anci.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo je p�edstaven�m tohoto kl�tera?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Kdo je p�edstaven�m tohoto kl�tera?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //My novicov� slou��me m�g�m kruhu ohn�. Ti se zodpov�daj� nejvy���mu shrom�d�n�, kter� sest�v� ze t�� nejmocn�j��ch �arod�j�.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Ale za v�e, co se t�k� novic�, je zodpov�dn� otec Parlan. Ve�ker� sv�j �as tr�v� na n�dvo��, kde dohl�� na pr�ci novic�.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mi m��e� ��ct o tomto kl�teru?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Co mi m��e� ��ct o tomto kl�teru?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Tady se star�me o to, abychom si zajistili sv� skromn� z�soby. Chov�me ovce a vyr�b�me v�no.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Tady je knihovna, ale mohou ji vyu��vat pouze m�gov� a vyvolen� novicov�.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //My novicov� se do n� pod�v�me, jen kdy� sem pro n�co jdeme m�g�m kruhu ohn�.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_3_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_3_STANDARD_Condition;
	information	= DIA_NOV_3_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};                       
func INT DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NOV_3_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Ty jsi zrovna ten prav�, co by se na to m�l pt�t! O ni�em jin�m ne� o tob� novicov� nemluv�.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Jen m�lokdy se stane, �e by se takov� nov��ek jako ty stal vyvolen�m kruhu ohn�.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //�as znovu nade�el. Jeden z novic� bude brzy p�ijat do kruhu ohn�.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Zkou�ka za�ne u� brzy.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Do na�eho ��du pronikl Beliar! Zlo mus� b�t velmi siln�, kdy� si dok�zalo naj�t spojence u� i tady.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro byl tady v kl�te�e u� cel� l�ta. Dlouh� �as, kter� str�vil venku, musel oslabit jeho v�ru, a tak snadno podlehl Beliarovu pokou�en�.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //P�i�el jsi pr�v� v�as. S�m Innos by nemohl zvolit vhodn�j�� dobu pro tv�j p��chod.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Zap�e� se do kroniky na�eho kl�tera jako mocn� zachr�nce Oka.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Zpr�vy z Hornick�ho �dol� jsou znepokojiv�. Innos n�s t�ce zkou��.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //��k� se, �e od paladin�, kte�� se vydali do Hornick�ho �dol�, zat�m nedorazily ��dn� zpr�vy. Nejvy��� rada bude v�d�t, co m� b�t u�in�no.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //��kaj�, �e bychom draky m�li zni�it za pomoci na�eho P�na. Beliarovy zr�dy stihne Innos�v hn�v.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Jen d�ky Innosovi se n�m poda�ilo za�ehnat bezprost�edn� hrozbu. Mus�me se vr�tit na cestu na�eho P�na, proto�e pouze s jeho pomoc� se m��eme postavit zlu.

	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc					= Hlp_GetInstanceID(slf);
};
