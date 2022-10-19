// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int DIEGO_COMING;
// -------------------------

INSTANCE DIA_Gerbrandt_EXIT(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 999;
	condition	= DIA_Gerbrandt_EXIT_Condition;
	information	= DIA_Gerbrandt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerbrandt_EXIT_Info()
{	
	if (DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc (PC_THIEF_NW);
				
		if ( Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine (DiegoNW,"GERBRANDT");
		};	
		//patch m.f. B_Startotherroutine raus und ersetzt durch Npc_exchange 
		
		Npc_ExchangeRoutine  (self,"NEWLIFE");
		B_StartOtherRoutine (GerbrandtsFrau,"NEWLIFE");
		
		DIEGO_COMING = 2; //Weder TRUE noch False
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerbrandt_PICKPOCKET (C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 900;
	condition	= DIA_Gerbrandt_PICKPOCKET_Condition;
	information	= DIA_Gerbrandt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukr�st mu pen�enku nebude nic t�k�ho.)";
};                       

FUNC INT DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	&& (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerbrandt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_BACK 		,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Gerbrandt_Hello(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 5;
	condition	= DIA_Gerbrandt_Hello_Condition;
	information	= DIA_Gerbrandt_Hello_Info;
	permanent	= FALSE;
	description = "Co tady d�l�?";
};                       

FUNC INT DIA_Gerbrandt_Hello_Condition()
{
	if (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_PAL)
	&& (DIEGO_COMING == FALSE) //nur BEVOR Diego kommt
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //Co tady d�l�?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //A ty jsi kdo? Vypad� to, �e jsi tu novej a nem� ani tucha, jak to tady chod�.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //��kaj� mi Gerbrandt. Pro tebe to znamen�: pan Gerbrandt. Jasn�?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Jo, jasn�, Gerbrandte.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Rozum�m, pane Gerbrandte.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Jo jasn�, Gerbrandte.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Bacha na tu svou nevym�chanou hubu. M�l bys mi rad�i prokazovat v�c �cty, nebo si tady zad�l� na po��dn� trable.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //Tady rozkazuju j�. Kdokoli tu zp�sob� n�jak� pot�e, bude se zodpov�dat mn� a ud�l� nejl�p, kdy� kvaltem opust� m�sto. Proto�e jestli se mi dostane do rukou, tak bude velmi litovat toho, �e se se mnou kdy setkal.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //V�t�ina lid� z okol� p��stavu pracuje pro m�. Jestli hled� pr�ci, m�l by sis d�vat velk� pozor na to, abys mi utkv�l v pam�ti jako hodnej hoch.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Rozum�m, pane Gerbrandte.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Nakonec ti netrvalo moc dlouho, ne� ti do�lo, kter� bije.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Jakmile se za�nou hejbat obchody, budu pot�ebovat urostl�ho chlapa, jako jsi ty.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //M�te tu p�kn� doky.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Um� ��st?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Ne.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nehled�m pr�ci.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Samoz�ejm�.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Ne.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Nevad�. Alespo� m��e� odn�st p�r pytl�.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Jsem s tebou spokojen�, m��u ti nab�dnout st�lou pr�ci. Je toho tady dost, co je t�eba ud�lat.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Dobr�, d�m ti v�d�t, a� se prvn� lo� vr�t� do dok�.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Nehled�m pr�ci.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Asi si mysl�, jak jsi stra�n� chytrej. Koukej, nikdo tu nem��e dostat pr�ci, dokud s t�m j� nebudu souhlasit.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Tak�e jestli bude� takhle pyskovat, m��e� si za��t hledat tou nejhnusn�j�� hav�t� prolezlej slamn�k na span�, proto�e to bude v�echno, co si bude� moct dovolit.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Je�t� za mnou p�ileze� a bude� �adonit o pr�ci.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Samoz�ejm�.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Fajn, fajn, dostat se ke kvalifikovan�mu person�lu nen� nic lehk�ho.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Co tv� doporu�en�?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Doporu�en�?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //Dobr�, budu si t� pamatovat. Jakmile se zase za�nou hejbat obchody, p�ij� se mi uk�zat. Pak pro tebe budu mo�n� m�t n�jakou pr�ci.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //Co jako m� b�t tohle - d�l� si ze m� srandu?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Ty a ten tv�j k�mo� Diego u� jste nad�lali dost �kody.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //Nech m� b�t!
	
	//Patch m.f. Wenn diego kommt und er wird gefragt, geht er nicht los, weil losgehen steht in exit info und durch diesen Ai_Stop wird das umgangen
	if (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		AI_StopProcessInfos (self);
	};
};

INSTANCE DIA_Gerbrandt_Perm(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 800;
	condition	= DIA_Gerbrandt_Perm_Condition;
	information	= DIA_Gerbrandt_Perm_Info;
	permanent	= TRUE;
	description	= "Co je nov�ho?";
};                       

FUNC INT DIA_Gerbrandt_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Perm_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //N�co nov�ho?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Lidi jako ty nemaj� tady naho�e co d�lat. Tady bydl� v�en� ob�an�, ne n�jac� tul�ci nebo podvodn�ci.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Jestli se ti n�kdy poda�� zbohatnout a doj�t �cty, pak tady mo�n� bude� v�tan�j��.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Nem��u si st�ovat, v�en� pane.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //U� jsem vid�l tob� podobn� - prost� nev�te, kam pat��te.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Mus�m si promluvit s m�stodr��c�m ohledn� odpov�daj�c�ho zabezpe�en� horn� �tvrti.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //Tohle je jenom moje z�le�itost. Nem�m �as!
			};
		}
		else
		{
			B_Gerbrandt_PissOff ();
		};
	};
};

//################################
//##
//##	Kapitel 3
//##
//################################

INSTANCE DIA_Gerbrandt_GreetingsFromDiego(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 10;
	condition	= DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information	= DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent	= FALSE;
	description	= "Diego se nech� pozdravovat.";
};                       

FUNC INT DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	
	if (MIS_DiegosResidence == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_DiegosLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Diego se nech� pozdravovat.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(vyd�en�) Co? Kdo? Jak� Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //A taky m� po��dal, abych ti dal tenhle dopis.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(znepokojen�) To nem��e b�t pravda. Ne. Jsem mrtv� mu�!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(ustra�en�) Je teda ve m�st�?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Kdo?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, p�ece!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Ano, zanedlouho se s n�m setk�m.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(zoufale, pro sebe) Tak to je konec. V�echno je v tahu.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Nem�m �as, mus�m odtud vypadnout. Jestli m� tu najde, jsem vy��zenej.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
