///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lehmar_EXIT   (C_INFO)
{
	npc         = VLK_484_Lehmar;
	nr          = 999;
	condition   = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Entschuldigung
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_ENTSCHULDIGUNG		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  2;
	condition	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co s�ycha�?";
};

func int DIA_Lehmar_ENTSCHULDIGUNG_Condition ()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_00"); //Co s�ycha�?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_01"); //Ile chcesz?
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_02"); //Co masz na my�li?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_03"); //Zajmuj� si� po�yczkami. Skoro do mnie przychodzisz, to czego m�g�by� chcie�? Oczywi�cie - pieni�dzy!
};

///////////////////////////////////////////////////////////////////////
//	Info GeldLeihen
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDLEIHEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_GELDLEIHEN_Condition;
	information	 = 	DIA_Lehmar_GELDLEIHEN_Info;
	permanent	 = 	TRUE;
	description	 = 	"Po�ycz mi troch� pieni�dzy!";
};
//----------------------------------------
var int DIA_Lehmar_GELDLEIHEN_noPerm;
//----------------------------------------
func int DIA_Lehmar_GELDLEIHEN_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Lehmar_ENTSCHULDIGUNG))
	&&  (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_15_00"); //Po�ycz mi troch� pieni�dzy!
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_09_01"); //Jasne. Ile chcesz? Pobieram 20 procent od po�yczanej sumy.

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "Musz� si� zastanowi�.", DIA_Lehmar_GELDLEIHEN_back );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "1000 sztuk z�ota.", DIA_Lehmar_GELDLEIHEN_1000 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, " 200 sztuk z�ota.", DIA_Lehmar_GELDLEIHEN_200 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "   50 sztuk z�ota.", DIA_Lehmar_GELDLEIHEN_50 );
	
	
};
func void DIA_Lehmar_GELDLEIHEN_back ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_back_15_00"); //Musz� si� zastanowi�.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_back_09_01"); //Zdecyduj si�! Nie marnuj mojego czasu!

	AI_StopProcessInfos (self);
};

func void DIA_Lehmar_GELDLEIHEN_50 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_50_15_00"); //50 sztuk z�ota.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_50_09_01"); //Tak na pr�b�, co? Jutro chc� je z powrotem, jasne?

	CreateInvItems (self, ItMi_Gold, 50);
	B_GiveInvItems (self, other, ItMi_Gold, 50);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 50;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_200 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_200_15_00"); //200 sztuk z�ota.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_200_09_01"); //To sporo pieni�dzy. Jutro masz si� tutaj zjawi� wraz z moim z�otem, jasne?
	

	CreateInvItems (self, ItMi_Gold, 200);
	B_GiveInvItems (self, other, ItMi_Gold, 200);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 200;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_1000 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_1000_15_00"); //1000 sztuk z�ota.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_01"); //Chyba nie masz zbyt r�wno pod sufitem?
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_02"); //Dam ci 100. I pami�taj, jutro chc� je z powrotem!
	

	CreateInvItems (self, ItMi_Gold, 100);
	B_GiveInvItems (self, other, ItMi_Gold, 100);


	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 100;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);
};

///////////////////////////////////////////////////////////////////////
//	Info warumGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_WARUMGELD		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_WARUMGELD_Condition;
	information	 = 	DIA_Lehmar_WARUMGELD_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy po�yczasz pieni�dze ka�demu, kto o nie prosi?";
};

func int DIA_Lehmar_WARUMGELD_Condition ()
{
	if (Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_WARUMGELD_15_00"); //Czy po�yczasz pieni�dze ka�demu, kto o nie prosi?
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_01"); //Spokojnie, wszyscy zwracaj� je na czas. Ty te� jutro tu przyjdziesz albo znajd� ci� i zabij�. Proste, prawda?
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_02"); //Masz tak charakterystyczn� facjat�, �e znalezienie ci� nie zaj�oby mi du�o czasu.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_03"); //Wi�c niech ci si� nawet nie �ni, �e m�g�by� mnie wykiwa�.
};
///////////////////////////////////////////////////////////////////////
//	Info geldeintreiben
///////////////////////////////////////////////////////////////////////
var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  5;
	condition	 = 	DIA_Lehmar_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Lehmar_GELDEINTREIBEN_Condition ()
{
	if ((Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	&& (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_00"); //Ty draniu, oddawaj moje pieni�dze! A poniewa� sp�ni�e� si� ze sp�at�, tw�j d�ug w�a�nie ur�s�.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_01"); //Zamiast standardowych 20 procent b�dziesz mi teraz musia� odda� 30.


	Info_ClearChoices	(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Chc� sp�aci� moje d�ugi.", DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen );
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Nic z tego, nie oddam ci �adnych pieni�dzy.", DIA_Lehmar_GELDEINTREIBEN_kannstmich );
};
func void DIA_Lehmar_GELDEINTREIBEN_kannstmich ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00"); //Nic z tego, nie oddam ci �adnych pieni�dzy.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01"); //O tak, zapewniam ci�, �e dasz.
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos (self);		
	
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00"); //Chc� sp�aci� moje d�ugi.

				 	///////////////////////////////////////////////////////////////////////	
		 	
				 				 	if (Lehmar_GeldGeliehen == 50)
										{
											Lehmar_GeldGeliehen_MitZinsen = 65;	
										};
									if (Lehmar_GeldGeliehen == 200)
										{
											Lehmar_GeldGeliehen_MitZinsen = 260;	
										};
									if (Lehmar_GeldGeliehen == 100)
										{
											Lehmar_GeldGeliehen_MitZinsen = 130;	
										};
					///////////////////////////////////////////////////////////////////////						
										IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);


	if ((Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
	{
		B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
		
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01"); //Twoje szcz�cie! A teraz spadaj!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02"); //Nie masz wystarczaj�co du�o pieni�dzy! No dobrze, widz�, �e b�d� musia� da� ci nauczk�.
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03"); //Nie bierz tego do siebie. Po prostu musz� dba� o swoj� z�� reputacj�.
		Lehmar_vorbei = TRUE;
		
		AI_StopProcessInfos (self);		
		
		B_Attack (self, other, AR_NONE, 1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Geldzur�ck
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDZURUECK		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  6;
	condition	 = 	DIA_Lehmar_GELDZURUECK_Condition;
	information	 = 	DIA_Lehmar_GELDZURUECK_Info;
	permanent	 =  TRUE;
	description	 = 	"Oto twoje pieni�dze!";
};
func int DIA_Lehmar_GELDZURUECK_Condition ()
{
	if 	(!(Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))
	&&  (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDZURUECK_15_00"); //Oto twoje pieni�dze!

	if  (RangerHelp_LehmarKohle == TRUE)
	&& (Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_00"); //Nie zajmuj si� tym - Lares ju� rozwi�za� ten problem.
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_01"); //Ten osio�, z kt�rym si� kumplujesz? To nie moja sprawa - mi�ego dnia �ycz�.
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
					 	///////////////////////////////////////////////////////////////////////	
					 								 	
					 				 	if (Lehmar_GeldGeliehen == 50)
											{
												Lehmar_GeldGeliehen_MitZinsen = 60;	
											};
										if (Lehmar_GeldGeliehen == 200)
											{
												Lehmar_GeldGeliehen_MitZinsen = 240;	
											};
										if (Lehmar_GeldGeliehen == 100)
											{
												Lehmar_GeldGeliehen_MitZinsen = 120;	
											};
						///////////////////////////////////////////////////////////////////////						
											IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);
		
		if ( (Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
		{
			B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
				
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_01"); //Wspaniale! Interesy z tob� to czysta przyjemno��.
				
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos (self);		
		}
		else
		{
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_02"); //Jeste� kompletnie sp�ukany! Wr��, kiedy ju� zdob�dziesz pieni�dze. Termin jeszcze nie up�yn��. I pami�taj, 20 procent!
			AI_StopProcessInfos (self);		
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info NOCHMALGELD
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_NOCHMALGELD		(C_INFO)
{
	npc		 	 = 	VLK_484_Lehmar;
	nr			 =  8;
	condition	 = 	DIA_Lehmar_NOCHMALGELD_Condition;
	information	 = 	DIA_Lehmar_NOCHMALGELD_Info;
	permanent	 =	TRUE;	//Joly: letzte Info die im KAPITEL 1 Stehen bleibt
	description	 = 	"Czy m�g�bym od ciebie po�yczy� troch� pieni�dzy?";
};
func int DIA_Lehmar_NOCHMALGELD_Condition ()
{
	if 	((Lehmar_GeldGeliehen == 0)
	&&  (Lehmar_GeldGeliehen_MitZinsen != 0)) //Joly: SC hat sich schon mal Geld geliehen!
	{
		return TRUE;
	};
};
func void DIA_Lehmar_NOCHMALGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_NOCHMALGELD_15_00"); //Czy m�g�bym od ciebie po�yczy� troch� pieni�dzy?

	if (Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))//Joly: SC hat Schulden nicht ordnungsgem�� zur�ck gezahlt!
	|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_01"); //Czy masz mnie za g�upca? Spadaj st�d!
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_02"); //Nic nie dostaniesz! Mia�em ostatnio spore wydatki i potrzebuj� ka�dej monety.
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_03"); //Wr�� za par� dni!
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lehmar_PICKPOCKET (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 900;
	condition	= DIA_Lehmar_PICKPOCKET_Condition;
	information	= DIA_Lehmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tej ma�ej ksi��eczki b�dzie dziecinnie �atwa)";
};                       

FUNC INT DIA_Lehmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Schuldenbuch) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_BACK 		,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItWr_Schuldenbuch, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  			Schuldenbuch weg
// ************************************************************

INSTANCE DIA_Lehmar_BuchWeg (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_BuchWeg_Condition;
	information	= DIA_Lehmar_BuchWeg_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lehmar_BuchWeg_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_BuchWeg_Info()
{	
	AI_Output (self, other, "DIA_Lehmar_Add_09_00"); //Jaki� dra� ukrad� moj� ksi�g� rachunkow�...
	AI_Output (self, other, "DIA_Lehmar_Add_09_01"); //Nie mia�e� z tym chyba nic wsp�lnego, prawda?
	AI_Output (other, self, "DIA_Addon_Lehmar_Add_15_02"); //Ja? Nie.
	AI_Output (self, other, "DIA_Lehmar_Add_09_03"); //Tak, tak, oczywi�cie. A teraz wyno� si� st�d.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  			Lehmar verhauen
// ************************************************************
INSTANCE DIA_Lehmar_verhauen (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_verhauen_Condition;
	information	= DIA_Lehmar_verhauen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lehmar_verhauen_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
		|| (Lehmar_vorbei == TRUE)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Lehmar_verhauen_Info()
{	
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};





