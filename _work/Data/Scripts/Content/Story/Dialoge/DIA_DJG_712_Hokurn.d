
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Hokurn_EXIT   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 999;
	condition   = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Hokurn_Hello   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 4;
	condition   = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Hokurn_Hello_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Hello_Info()
{
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_00"); //Nem� n�co k pit�?
	AI_Output (other,self ,"DIA_Hokurn_Hello_15_01"); //A asi to nem� b�t voda, co?
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_02"); //To teda ne, ksakru!! Pot�ebuju n�jakej alkohol, abych se kone�n� zbavil toho zatracen�ho bolehlavu.
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_03"); //Jestli se brzo n��eho nenapiju, nejsp� mi pukne hlava.

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,"Nem�m ti co d�t.",DIA_Hokurn_Hello_No);
	
	IF(	(Npc_HasItems (other,ItFo_Beer) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Wine) 	>=1))
	{
		Info_AddChoice (DIA_Hokurn_Hello,"Tady, vezmi si tohle.",DIA_Hokurn_Hello_Yes);
	};
};

FUNC VOID DIA_Hokurn_Hello_No ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_No_15_00"); //Nem�m nic, co bych ti mohl d�t.
	AI_Output (self ,other,"DIA_Hokurn_Hello_No_01_01"); //Tak zmizni!

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"Je�t� jedna v�c.",DIA_Hokurn_Hello_ASK1);
};

FUNC VOID DIA_Hokurn_Hello_ASK1 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK1_15_00"); //Je�t� jedna v�c...
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK1_01_01"); //(povzdech) Tys mi nerozum�l? VYPADNI!!!
	
	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"Je to d�le�it�.",DIA_Hokurn_Hello_ASK2);
};

FUNC VOID DIA_Hokurn_Hello_ASK2 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK2_15_00"); //Je to d�le�it�.
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK2_01_01"); //(povzdech) �ekl sis o to.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Hokurn_Hello_END ()
{
	AI_StopProcessInfos (self);
};

FUNC VOID B_Hokurn_Sauf ()
{
	AI_Output (self ,other,"B_Hokurn_Sauf_01_00"); //(��hnut�) Ha, tohle jsem pot�eboval.
	AI_Output (self ,other,"B_Hokurn_Sauf_01_01"); //Te� m��u znova myslet s �istou hlavou. Co pro tebe m��u ud�lat?
};

FUNC VOID DIA_Hokurn_Hello_Yes ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_Yes_15_00"); //Tady, vezmi si tohle.
	
	IF		(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1)  
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay ();
	HokurnGetsDrink = TRUE;
	
	B_Hokurn_Sauf ();
	
	Info_ClearChoices (DIA_Hokurn_Hello);
};

//*********************************************************************
//	Ich hab dir was zu Trinken mitgebracht.
//*********************************************************************
INSTANCE DIA_Hokurn_Drink   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent   = TRUE;
	description = "Tady m� n�co k pit�.";
};

FUNC INT DIA_Hokurn_Drink_Condition()
{
	if(	(HokurnGetsDrink == FALSE)
	&&(	(Npc_HasItems (other,ItFo_Beer) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Wine) 	>=1)))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Drink_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Drink_15_00"); //Tady m� n�co k pit�.
	AI_Output (self ,other,"DIA_Hokurn_Drink_01_01"); //(dychtiv�) Dej to sem!!
	
	IF	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1)  
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay ();
	HokurnGetsDrink = TRUE;
	
	B_Hokurn_Sauf ();
};

//*********************************************************************
//	Ich hab da ein paar Fragen.
//*********************************************************************
INSTANCE DIA_Hokurn_Question   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent   = TRUE;
	description = "Pot�ebuju n�jak� informace.";
};

FUNC INT DIA_Hokurn_Question_Condition()
{
	if	(HokurnGetsDrink == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Question_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Question_15_00"); //Pot�ebuju n�jak� informace.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_01"); //(otr�ven�) M�l jsem dojem, �e jsme si rozum�li. Mluv�m jen s p��teli.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_02"); //A p��tel� ti nab�dnou n�co k pit�. Jasn�? Te� odpal!
};

//*********************************************************************
//	Ich such jemanden, der mir was beibringen kann.
//*********************************************************************
INSTANCE DIA_Hokurn_Learn   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 6;
	condition   = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent   = FALSE;
	description = "Hled�m n�koho, kdo by m� mohl n��emu nau�it.";
};

FUNC INT DIA_Hokurn_Learn_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Learn_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_15_00"); //Hled�m n�koho, kdo by m� mohl n��emu nau�it.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_01"); //M��u ti uk�zat p�r v�c�. Jsem nejlep�� bojovn�k na m�le daleko.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_02"); //Jeliko� jsme p��tel�, ud�l�m ti zvl�tn� cenu. 300 zlat�ch.

	Info_ClearChoices (DIA_Hokurn_Learn);
	Info_AddChoice	(DIA_Hokurn_Learn,"To je pro m� moc drah�.",DIA_Hokurn_Learn_TooExpensive);
	if (Npc_HasItems (other,ItMi_Gold) >= 300)
	{
		Info_AddChoice	(DIA_Hokurn_Learn,"Dobr�, tady jsou pen�ze.",DIA_Hokurn_Learn_OK);
	};	 
};

FUNC VOID DIA_Hokurn_Learn_TooExpensive ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_TooExpensive_15_00"); //To je pro m� moc drah�.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_01"); //Moc drah�? To je nejm��, co by si na m�m m�st� �ekl kdokoli jin�.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_02"); //P�em��lej o tom.
	
	Info_ClearChoices (DIA_Hokurn_Learn);
};

FUNC VOID DIA_Hokurn_Learn_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_OK_15_00"); //Dobr�, tady jsou pen�ze.
	B_GiveInvItems (other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Hokurn_Learn);
};

//*********************************************************************
//	Hier ist dein Geld. Ich will trainieren.
//*********************************************************************
INSTANCE DIA_Hokurn_PayTeacher   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 6;
	condition   = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent   = TRUE;
	description = "Tady jsou pen�ze. Chci, abys m� u�il.";
};

FUNC INT DIA_Hokurn_PayTeacher_Condition()
{
	if	(Npc_KnowsInfo (other,DIA_Hokurn_Learn))
	&&	(Npc_HasItems (other,ItMi_Gold) >= 300)
	&& 	(HoKurn_TeachPlayer == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_PayTeacher_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_PayTeacher_15_00"); //Tady jsou pen�ze. Chci, abys m� u�il.
	AI_Output (self ,other,"DIA_Hokurn_PayTeacher_01_01"); //Nebude� litovat!

	B_GiveInvItems (other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
};

//*********************************************************************
//	Hier ist dein Drink.
//*********************************************************************
INSTANCE DIA_Hokurn_DrinkAndLearn   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 7;
	condition   = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent   = TRUE;
	description = "Tady je pro tebe n�co k pit�.";
};

FUNC INT DIA_Hokurn_DrinkAndLearn_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	&&(	(Npc_HasItems (other,ItFo_Booze) >= 1)
	||	(Npc_HasItems (other,ItFo_Wine) >= 1)
	||	(Npc_HasItems (other,ItFo_Beer) >= 1))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_DrinkAndLearn_15_00"); //Tady je pro tebe n�co k pit�.
	
	IF	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1) 
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	
	HokurnLastDrink = Wld_GetDay ();
	
	AI_Output (self ,other,"DIA_Hokurn_DrinkAndLearn_01_01"); //C�t�m se o moc l�p. Jsem p�ipraven na v�e.

};

//*********************************************************************
//	Lass uns trainieren!
//*********************************************************************

INSTANCE DIA_Hokurn_Teach(C_INFO)
{
	npc			= DJG_712_Hokurn;
	nr			= 7;
	condition	= DIA_Hokurn_Teach_Condition;
	information	= DIA_Hokurn_Teach_Info;
	permanent	= TRUE;
	description = "Za�n�me s tr�ninkem.";
};                       

FUNC INT DIA_Hokurn_Teach_Condition()
{
	IF (Hokurn_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hokurn_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hokurn_Teach_15_00"); //Za�n�me s tr�ninkem.
	
	if (HokurnLastDrink < Wld_GetDay ())
	{
		AI_Output (self ,other,"DIA_Hokurn_Teach_01_01"); //Nejd��v mi p�ines n�co k pit�!
	}
	else
	{	 
		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_02"); //Tak se teda uvid�, co m��eme dostat z t�ch tvejch zatuhlejch paladinskejch kost�, jasn�?
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_03"); //Co ty v�. Dokonce i m�gov� pou��vaj� chladn� zbran�.
		};

		Info_ClearChoices 	(DIA_Hokurn_Teach);
		Info_AddChoice 		(DIA_Hokurn_Teach,	DIALOG_BACK		,DIA_Hokurn_Teach_Back);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hokurn_Teach_2H_1);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hokurn_Teach_2H_5);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Hokurn_Teach_1H_1);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Hokurn_Teach_1H_5);
	};
};

FUNC VOID DIA_Hokurn_Teach_Back ()
{
	Info_ClearChoices (DIA_Hokurn_Teach);
};
FUNC VOID B_Hokurn_TeachedEnough ()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00"); //Na tuhle discipl�nu u� nepot�ebuje� ��dn�ho u�itele.
};

FUNC VOID DIA_Hokurn_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hokurn_Teach_2H_1);	
};

FUNC VOID DIA_Hokurn_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))	,DIA_Hokurn_Teach_2H_5);	
};

FUNC VOID DIA_Hokurn_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Hokurn_Teach_1H_1);	
};

FUNC VOID DIA_Hokurn_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)) ,DIA_Hokurn_Teach_1H_5);	
};

//*********************************************************************
//	Wieso h�ngt ihr hier �berhaupt rum?
//*********************************************************************
INSTANCE DIA_Hokurn_StayHere   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent   = FALSE;
	description = "A co tady vlastn� d�l�?";
};

FUNC INT DIA_Hokurn_StayHere_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_StayHere_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_StayHere_15_00"); //A co tady vlastn� d�l�?
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_01"); //Nem�m tu�en�, pro� jsme sem p�i�li, nebo kdy to za�ne.
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_02"); //A dokud m�m co p�t, ani se o to nestar�m.
	
	/*
	AI_Output (other,self ,"DIA_Addon_Hokurn_StayHere_15_00"); //Was wollt ihr hier �berhaupt?
	AI_Output (self ,other,"DIA_Addon_Hokurn_StayHere_01_01"); //Keine Ahnung, was wir hier machen oder wann es los geht.
	AI_Output (self ,other,"DIA_Addon_Hokurn_StayHere_01_02"); //Ist mir auch egal, solange ich genug zu trinken habe.
	*/
	
};

//*********************************************************************
//	Wisst ihr denn, wo die Drachen sind.
//*********************************************************************
INSTANCE DIA_Hokurn_WhereDragon   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent   = TRUE;
	description = "Tak v�, kde ty draci jsou?";
};

FUNC INT DIA_Hokurn_WhereDragon_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	&& 	(HokurnTellsDragon == FALSE)
	&&	(Npc_KnowsInfo (other,DIA_Hokurn_StayHere))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_WhereDragon_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_15_00"); //Tak v�, kde ti draci jsou?
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_01_01"); //Co z toho budu m�t, kdy� ti to �eknu?

	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Nic, vyd�m se za nima s�m.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Jsem ochoten ti za tu informaci zaplatit.",DIA_Hokurn_WhereDragon_Gold);
	if Npc_HasItems (other,ITFO_BOOZE) >=1
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"Je�t� tu m�m l�hev ginu!",DIA_Hokurn_WhereDragon_Booze);	 
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_FindMyself ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_FindMyself_15_00"); //Nic, vyd�m se za nima s�m.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01"); //M�l by sis d�vat pozor. �ek� t� spousta boj�.
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Gold ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Gold_15_00"); //Jsem ochoten ti za tu informaci zaplatit.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Gold_01_01"); //Zaplatit mi? Hmm. Za 200 zlat�ch ti to pov�m.
	
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"To je moc!",DIA_Hokurn_WhereDragon_TooMuch);
	if Npc_HasItems (other,ItMi_Gold) >=200
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"Tady jsou pen�ze!",DIA_Hokurn_WhereDragon_OK);
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_TooMuch ()
{
	AI_Output	(other,self ,"DIA_Hokurn_WhereDragon_TooMuch_15_00"); //To je moc!
	AI_Output 	(self ,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01"); //Tak to na to zapome�.
	Info_ClearChoices	(DIA_Hokurn_WhereDragon); 
};

FUNC VOID DIA_Hokurn_WhereDragon_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_OK_15_00"); //Tady jsou pen�ze!
	B_GiveInvItems (other,self,ItMi_gold,200);
	
	HokurnTellsDragon = TRUE;
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Booze ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Booze_15_00"); //Je�t� tu m�m l�hev ginu!
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_01"); //Za po��dnou pitku bych zabil v�echny draky sv�ta.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_02"); //Souhlas. Dej sem tu l�hev!
	B_GiveInvItems ( other,self,ItFo_booze,1);
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_03"); //Schov�m si ji na hor�� �asy.

	HokurnTellsDragon = TRUE;
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

//*********************************************************************
//	Also, wo sind jetzt die Drachen?
//*********************************************************************
INSTANCE DIA_Hokurn_Dragon   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent   = TRUE;
	description = "Dobr�, tak kde jsou ti draci?";
};

FUNC INT DIA_Hokurn_Dragon_Condition()
{
	if	(HokurnTellsDragon == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Dragon_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Dragon_15_00"); //Dobr�, tak kde jsou ti draci?
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_01"); //P�irozen� ti to ne�eknu �pln� p�esn�, ale sly�el jsem, �e by tu m�li b�t celkem �ty�i.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_02"); //V noci jsme zahl�dli nad nejvy��� horou rudou z��i.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_03"); //P��sah�m na hrob m� matky, pokud hled� draka, tak kdy� nikde jinde, tam ho ur�it� najde�.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Hokurn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent   = TRUE;
	description	= "Zabil jsem v�echny draky.";
				
};

FUNC INT DIA_Hokurn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Hokurn_AllDragonsDead_15_00"); //Zabil jsem v�echny draky.
	AI_Output 	(self ,other,"DIA_Hokurn_AllDragonsDead_01_01"); //Ud�lej si v�let a vypr�v�j sv� poh�dky n�komu jin�mu.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hokurn_PICKPOCKET (C_INFO)
{
	npc			= DJG_712_Hokurn;
	nr			= 900;
	condition	= DIA_Hokurn_PICKPOCKET_Condition;
	information	= DIA_Hokurn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Hokurn_PICKPOCKET_Condition()
{
	C_Beklauen (69, 210);
};
 
FUNC VOID DIA_Hokurn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice		(DIA_Hokurn_PICKPOCKET, DIALOG_BACK 		,DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hokurn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hokurn_PICKPOCKET);
};
	
func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hokurn_PICKPOCKET);
};



