// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_NW_EXIT(C_INFO)
{
	npc			= PIR_1300_Addon_Greg_NW;
	nr			= 999;
	condition	= DIA_Addon_Greg_NW_EXIT_Condition;
	information	= DIA_Addon_Greg_NW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_NW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	PlayerTalkedToGregNW	= TRUE;
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//1. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info HalloW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Greg_NW_Hallo_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_Hallo_Condition ()
{
	if (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Hallo_Info ()
{

	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_00"); //Sst – hej, ty, pojë sem!
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Hallo_15_01"); //Co je?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_02"); //Jdeš do męsta? A seš furt v jednom kole, co?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_03"); //(podlézavę) Poslyš, vypadáš jako chytrej chlap. Vsadím se, že to dotáhneš daleko.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_04"); //Určitę se nenecháš jen tak oblbnout. To poznám hned na první pohled.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_05"); //Povęz, nechtęl by sis vydęlat pár zlaăáků?

	PlayerTalkedToGregNW	= TRUE;
	SC_MeetsGregTime = 1; //Joly: erste Mal getroffen.

	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "K tęm męstským strážím...", DIA_Addon_Greg_NW_Hallo_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Pâestaŕ kecat kraviny a vyklop, co víš.", DIA_Addon_Greg_NW_Hallo_schleim );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Nevypadáš jako nękdo, komu by v kapsách cinkaly zlaăáky.", DIA_Addon_Greg_NW_Hallo_vorsicht );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Ukrýváš se pâed nękým?", DIA_Addon_Greg_NW_Hallo_hide );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Proč ne?", DIA_Addon_Greg_NW_Hallo_ja );

};

func void DIA_Addon_Greg_NW_Hallo_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_weg_15_00"); //Musím už jít.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_weg_01_01"); //(otrávenę) Takže mi nepomůžeš. To ti nezapomenu, kámo. Ještę se sejdeme.

	AI_StopProcessInfos (self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_ja_15_00"); //Proč ne?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_01"); //Odpusă nevzdęlanýmu námoâníkovi, jsem tady cizí a nevím pâesnę, jak to tady chodí.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_02"); //Tak jsem musel dost bolestivę zjistit, že v tomhle pâístavním męstę si na cizince zrovna nepotrpęj.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_03"); //(pâehnaná sebelítost) Teë tu stojím a nemám ponętí, jak se dostat do męsta.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_04"); //Musím tam vyâídit jednu fakt důležitou záležitost a můj zákazník mi neodpustí, když se zpozdím, chápeš?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_05"); //Pomůžeš mi najít způsob, jak se dostat kolem stráží, vië že jo?
	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	
	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Ten divný chlapík s páskou pâes oko se chce dostat do pâístavního męsta. Mám zaâídit, aby nęjak prošel pâes męstské stráže."); 
	
	MIS_Addon_Greg_BringMeToTheCity = LOG_RUNNING;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_vorsicht_15_00"); //Nevypadáš zrovna na boháče.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_01"); //(pâehnaná skromnost) No, určitę se nepohybuju ve stejnejch kruzích jako džentlmen tvýho kalibru.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_02"); //Ale určitę nevodmítneš malej pâíspęveček ke tvýmu určitę značnýmu majetku.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_03"); //Tak co ty na to? Můžu s tebou počítat?

};

func void DIA_Addon_Greg_NW_Hallo_schleim ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_schleim_15_00"); //Pâestaŕ plácat kraviny a radši vyklop, co chceš.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_01"); //Vidíš? Tohle pâesnę myslím.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_02"); //Pękný âečičky ještę nikdy nikomu nepomohly.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_03"); //Já vędęl, že mám pâed sebou tvrdýho vobchodníka.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_04"); //Ty seš vobchodník a určitę bys rád pâidal nęco málo do męšce, co?
};

func void DIA_Addon_Greg_NW_Hallo_hide ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_hide_15_00"); //Ty se pâed nękým skrýváš?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_01"); //Jistęže ne. To je hloupost. Jen prostę radši stojím mezi stromama, aby mi vítr nefoukal do ksichtu.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_02"); //Ale co ty? Chceš tu práci?
};

///////////////////////////////////////////////////////////////////////
//	Info Stadtwachen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Stadtwachen		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information	 = 	DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent	 = 	TRUE;

	description	 = 	"K tęm męstským strážím...";
};

func int DIA_Addon_Greg_NW_Stadtwachen_Condition ()
{
	if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Stadtwachen_15_00"); //Co se týče tęch męstských strážných...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Stadtwachen_01_01"); //Ano? Napadá tę nęco?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Napâed si to musím rozmyslet.", DIA_Addon_Greg_NW_Stadtwachen_nochnicht );

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "A co takhle je podplatit?", DIA_Addon_Greg_NW_Stadtwachen_geld );
	};

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE)
	&& (Npc_HasItems (other,ItWr_Passierschein))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Mám pâístup do męsta.", DIA_Addon_Greg_NW_Stadtwachen_Schein );
	};
	
	if (MIS_Addon_Lester_PickForConstantino != 0)
	&& (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Můžeš se tam dostat jako bylinkáâ.", DIA_Addon_Greg_NW_Stadtwachen_constantino );
	};

	IF	((Npc_HasItems (other,ItAr_BAU_L)) || (Npc_HasItems (other,ItAr_BAU_M)))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Když si oblékneš tenhle selský odęv, męli by tę tam pustit.", DIA_Addon_Greg_NW_Stadtwachen_klamotten );
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00"); //Męli by tę pustit, když si oblékneš tyhle selské šaty.

	if (Npc_HasItems (other,ItAr_BAU_L))
	{
		B_GiveInvItems 		(other, self, ItAr_BAU_L,1);
	}
	else //ITAR_BAU_M
	{
		B_GiveInvItems 		(other, self, ITAR_BAU_M,1);
	};

	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01"); //Pâesnę to potâebuju. Já vędęl, že s tebou můžu počítat.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02"); //Nenechám se otravovat vod nękoho, kdo se voblíká jako kâupan, haha.

	if (Npc_HasItems (self,ItAr_BAU_L))
	{
		AI_EquipArmor 		(self,ItAr_BAU_L);
	}
	else //ITAR_BAU_M
	{
		AI_EquipArmor 		(self,ITAR_BAU_M);
	};
	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03"); //Výbornę, to bylo fakt skvęlý. Tady máš slíbenou vodmęnu.
	
	CreateInvItems (self, ItMi_Gold, 50);									
	B_GiveInvItems (self, other, ItMi_Gold, 50);	
	B_GivePlayerXP (XP_Greg_NW_GiveBauArmor);				
	
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04"); //(naštvanę) Cože? Mizernejch 50 zlaăáků? To snad nemyslíš vážnę.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05"); //(blahosklonnę) Zlato není všecko, pâíteli. Prozatím si je vem.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06"); //Mám pocit, že se ještę brzo uvidíme.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07"); //A kdo ví? Možná ti tu laskavost voplatim. Tak se zatím vopatruj.
	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Markt");

	B_LogEntry (TOPIC_Addon_Greg_NW,"Dal jsem mu selský odęv. V nęm kolem stráží snadno projde."); 

	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};
func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00"); //To si napâed musím rozmyslet.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01"); //(vážnę) Dobâe, ale pospęš si. Nemám času nazbyt.
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Greg_NW_Stadtwachen_Schein ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00"); //Mám propustku do męsta.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01"); //(cynicky) Chápu. A to mám jako pâedstírat, že sem místní vobčan nebo co?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02"); //(otrávenę) Jen se na mę koukni, hochu. Tomu nikdo neuvęâí.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_constantino ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00"); //Můžeš se do męsta dostat jako sbęrač bylin.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01"); //(otrávenę) Cože? To vypadám, jako že v lesích sbírám kytičky?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_geld ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_geld_15_00"); //A co úplatek?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_geld_01_01"); //(šibalsky) No, kdyby to šlo, tak už bych to vyzkoušel.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PERM		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_PERM_Condition;
	information	 = 	DIA_Addon_Greg_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ještę jedna vęc...";
};
func int DIA_Addon_Greg_NW_PERM_Condition ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)||(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Greg_NW_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PERM_15_00"); //A eštę jedna vęc...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_01"); //(domýšlivę) Hele, kámo, teë tu mám důležitou práci.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_02"); //(hrozivę) Promluvíme si pozdęjc, kapišto?
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//2. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info MeetGregSecondTime
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_MeetGregSecondTime		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_00"); //A heleme se, kohopak to tu máme?

	if (MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_01"); //To je to sedlačisko.
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_02"); //Ten chlápek, co mę tak nestydatę vodpálkoval. To máš radost, že mę zase vidíš, co?
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_03"); //(vztekle) Já myslel, že mi pomůžeš, jenže ty ses z toho vyvlíknul.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_04"); //Myslel sis, že tam budu trčet nafurt, co?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_05"); //Ale teë se ukáže. Človęk si musí pomoct sám, protože nikdo jinej to za nęj neudęlá. Jenže teë už mi jen tak neutečeš.
	};

	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_06"); //Seš tu zrovna akorát.
	SC_SawGregInTaverne = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_wer		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_wer_Condition;
	information	 = 	DIA_Addon_Greg_NW_wer_Info;

	description	 = 	"Kdo vůbec jsi?";
};

func int DIA_Addon_Greg_NW_wer_Condition ()
{
	if (GregLocation >= Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_wer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_wer_15_00"); //Kdo vůbec jsi?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_01"); //Do toho ti nic nejni.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_02"); //Dybysem ti chtęl âíct, kdo jsem, už bysem to asi udęlal, nemyslíš?

	
};

///////////////////////////////////////////////////////////////////////
//	Info was
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_was		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_was_Condition;
	information	 = 	DIA_Addon_Greg_NW_was_Info;

	description	 = 	"Co ode mę chceš?";
};

func int DIA_Addon_Greg_NW_was_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func VOID B_Greg_Search_Dexter ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_00"); //Hledám jednoho chlápka. Nikde ve męstę není a tihle budižkničemové stejnę houby vędęj.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_01"); //Je štíhlej, má černý vlasy a vobvykle nosívá červený brnęní.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_02"); //Pokud vím, bejval vęznęm v kolonii. Myslím, že jeho jméno začíná na D.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Muž s páskou pâes oko hledá nękoho, jehož jméno začíná na D."); 

	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_00"); //Co po mnę chceš?

	if (MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_01"); //Ještę poâád máš problémy s męstskou stráží?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_was_01_02"); //(výhružnę) Problémy budeš mít TY, ty sketo!
	};	

	B_Greg_Search_Dexter ();

	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "To by mohl být Diego.", DIA_Addon_Greg_NW_was_Diego );

	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_was, "Nejmenuje se tâeba Dexter?", DIA_Addon_Greg_NW_was_Dexter );
	};
	
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Neznám nikoho, kdo by tomu popisu odpovídal.", DIA_Addon_Greg_NW_was_no );
};

func void DIA_Addon_Greg_NW_was_GregUnsicher ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_00"); //Jo, to by mohlo bejt vono, ale nevim to jistę.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_01"); //Spíš ho poznám, až ho uvidim.
};

func void DIA_Addon_Greg_NW_was_UnNun ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_UnNun_15_00"); //Ještę nęco?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_01"); //(naštvanę) Jo, ty žvanile. Eštę nęco.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_02"); //Potâebuju zbranę. Potâebuju zásoby. A bodlo by taky ŕáký to zlato.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Nemůžu ti pomoct.", DIA_Addon_Greg_NW_was_NoHelp );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Zásoby? Vždyă jsi v hospodę.", DIA_Addon_Greg_NW_was_Orlan );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Zbranę? Ty mají žoldáci.", DIA_Addon_Greg_NW_was_SLD );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Tady máš 10 zlaăáků.", DIA_Addon_Greg_NW_was_HierGold );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Copak jsi ve męstę nenašel žádného obchodníka se zbranęmi?", DIA_Addon_Greg_NW_was_Waffenhaendler );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Zlato? To chceme pâece všichni.", DIA_Addon_Greg_NW_was_Gold );
};

func void DIA_Addon_Greg_NW_was_NoHelp ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_NoHelp_15_00"); //Tak s tím ti pomoct nemůžu.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_01"); //(naštvanę) Radši rovnou âekni, že NECHCEŠ.
	
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_02"); //To už je podruhý, cos mę nechal ve štychu.
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_03"); //Dám ti dobrou radu: dej si poâádnýho majzla, abysme se už víckrát nesetkali.
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_04"); //To si piš, že si to zapamatuju.
	};	
	
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Začít");
};

func void DIA_Addon_Greg_NW_was_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_00"); //Zlato? To snad chceme všichni.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_01"); //To by šlo, ale co s ním budeš dęlat? Počítám, že to všecko prochlastáš nebo rozfofruješ v bordelu.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_02"); //Máš snad ŕákej lepší plán?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_03"); //(naštvanę) Kdybys vędęl, co všecko jsem udęlal, zalez bys do nejbližší díry.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_04"); //Nebuë drzej, nebo ti tu tvojí nevymáchanou hubu zavâu.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Waffenhaendler_15_00"); //To jsi ve męstę nenašel obchodníka se zbranęmi?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Waffenhaendler_01_01"); //To nemyslíš vážnę! Vždyă tam prodávaj samej šmejd!
};

func void DIA_Addon_Greg_NW_was_HierGold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_HierGold_15_00"); //Tady máš 10 zlaăáků.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_01"); //(smęje se) Ty naivo, prachy si můžeš nechat. Mám lepší plán.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_02"); //Nedaleko vodsuë je jeskynę! Už jsem tam byl a na pár místech tam zahrabal svý vęci.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_03"); //Ale nemůžu tam jít sám, páč je to moc nebezpečný. A tak by se mi šiklo, kdybys mi s tím pomoh.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Nabídl jsem muži s páskou pâes oko zlato, ale nechtęl je. Mám za ním jít do jeskynę."); 

	MIS_Addon_Greg_RakeCave = LOG_RUNNING;
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_SLD_15_00"); //Zbranę? Žoldáci mají zbranę.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_01"); //Zajímavý. Slyšel jsem, že ty kluky najal tlustej sedlák Onar.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_02"); //(smęje se) Na suchozemskou krysu to nejni špatný.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_03"); //Nejni to špatnej nápad, možná bysem je męl navštívit.
};
func void DIA_Addon_Greg_NW_was_Orlan ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Orlan_15_00"); //Zásoby? Vždyă jsi v hospodę.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Orlan_01_01"); //Ten pâipitomęlej hostinskej mi nechce nic dát, dokud mu to nezaplatim.
};

func void DIA_Addon_Greg_NW_was_no ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_no_15_00"); //Neznám nikoho, kdo by tomu popisu odpovídal.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_no_01_01"); //Možná to vím.
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Diego ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Diego_15_00"); //To mluvíš o Diegovi.
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Dexter ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Dexter_15_00"); //Nejmenuje se náhodou Dexter?
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveLos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCaveLos		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Info;

	description	 = 	"Tak pojëme do té jeskynę.";
};

func int DIA_Addon_Greg_NW_RakeCaveLos_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveLos_15_00"); //Tak pojëme do té jeskynę.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveLos_01_01"); //Pojë se mnou.
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"RakeCave");
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveThere
///////////////////////////////////////////////////////////////////////
	func void B_Greg_GoNow()
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_03"); //(velitelsky) Na co čekáš? Padej dovnitâ a pâines mi ty vęci!
	};
// --------------------------------------------------------------------

instance DIA_Addon_Greg_NW_RakeCaveThere		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_RakeCaveThere_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_00"); //Prima, kámo, tady je ta jeskynę.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_01"); //A tady máš krumpáč.
	B_GiveInvItems (self, other, itmw_2h_Axe_L_01, 1); //Spitzhacke	
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_02"); //Nękde jsem to tam zakopal, máš to voznačený kâížkem.
	B_Greg_GoNow();
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveThere_15_04"); //A co ty?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_05"); //Nękdo nám pâeci musí hlídat záda. Tak mazej fofrem dovnitâ.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Ten chlápek chce, abych mu v jeskyni našel jeho vęci. Místo, kde je zakopal, označil kâížkem. Také mi dal krumpáč, abych mohl 'poklad' dostat ven."); 

	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay(); 
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCavePlundered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCavePlundered		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition ()
{
	if ((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay()-2)) || (RAKEPLACE[Greg_FirstSecret] == TRUE))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_01_00"); //Co ses tam tak dlouho flákal? Už jsi nęco našel?
	
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "Ano. Vykopal jsem malý váček zlata.", DIA_Addon_Greg_NW_RakeCavePlundered_gold );
	};
	Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "Ne.", DIA_Addon_Greg_NW_RakeCavePlundered_No );
};
func void DIA_Addon_Greg_NW_RakeCavePlundered_No ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00"); //Ne.
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01"); //Zkoušíš, co vydržím, co?
		AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02"); //(s pâedstíranou nevinností) Nic TAM nebylo.
	};	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03"); //Ksakru, já to vędęl. Ti supi jsou rychlejší než já – už zase.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04"); //Ale to nic, brácho. Musim jít, uvidíme se pozdęjc.
	AI_StopProcessInfos (self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Začít");
};
var int B_Greg_RakePlaceBriefing_OneTime;
func void B_Greg_RakePlaceBriefing ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_00"); //Dobrá. V jezírku se dvęma vodopádama je malinkatej ostrůvek. Tam by męl bejt jeden z mejch úkrytů.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_01"); //Další dvę místa, kde jsem si nęco zakopal, sou na horních pastvinách.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_02"); //Jedno místo je tam za tím statkem a další je u vodopádů, co jsou u vstupu do průsmyku.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_03"); //Z polí tam nahoâe u statkáâe tam vedou schody.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_04"); //Další skrýš je v roklinę pod tęma schodama.

	if (B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_Addon_Greg_NW,"Vęci zakopal na více místech. 1) Na ostrůvku v jezeâe se dvęma vodopády. 2) Na horních pastvinách za statkem. 3) U vchodu do průsmyku u vodopádů. 4) V dolinę pod schody, které vedou z polí na horních pastvinách k velkostatkáâi. A já mu mám všechny tyhle vęci vykopat - počká na mę na kâižovatce mezi poli.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};                                                                                             
                                                                                               
func void DIA_Addon_Greg_NW_RakeCavePlundered_gold ()                                          
{                                                                                              
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00"); //Ano, vykopal jsem malý váček zlata.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01"); //(nenasytnę) Tak ho naval.

	if ((Npc_HasItems (other,ItSe_GoldPocket25))||(Npc_HasItems (other,ItMi_Gold)>= 25))
		{	
			if (B_GiveInvItems (other, self, ItSe_GoldPocket25,1))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02"); //Tumáš.
				}
			else if (B_GiveInvItems (other, self, ItMi_Gold,25))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03"); //Bylo tam 25 zlaăáků – tumáš, vezmi si je.
				};
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04"); //Skvęlý, takže tam eštę sou.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05"); //Nejseš zas tak nanicovatej.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06"); //Tak poslyš, zakopal jsem ještę další vęci. A chci, abys mi je našel.
			B_Greg_RakePlaceBriefing ();
			Greg_SuchWeiter = TRUE;
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07"); //Počkám na tebe na kâižovatce u statkáâovejch polí. A snaž se mę nezklamat, jinak toho budeš litovat, kámo.
			AI_StopProcessInfos (self);
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_GivePlayerXP (XP_Addon_RakeCavePlundered);
		}
	else
		{
			AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08"); //Už ho nemám.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09"); //Kecy. Mám to z tebe teda vymlátit?
			AI_StopProcessInfos (self);
			MIS_Addon_Greg_RakeCave = LOG_FAILED;//Joly:SC hat Greg angeschissen.
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_Attack (self, other, AR_NONE, 1);
		};
};

///////////////////////////////////////////////////////////////////////
//	PERM vor LakeCave
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_LakeCave	(C_INFO)
{
	npc		 	= PIR_1300_Addon_Greg_NW;
	nr		 	= 100; //alle anderen importants wichtiger
	condition	= DIA_Addon_Greg_NW_LakeCave_Condition;
	information	= DIA_Addon_Greg_NW_LakeCave_Info;
	permanent	= TRUE;
	important 	= TRUE;
};

func int DIA_Addon_Greg_NW_LakeCave_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 	
	&& (Greg_SuchWeiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info ()
{
	B_Greg_GoNow();
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WhereTreasures
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhereTreasures		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent	 = 	TRUE;

	description	 = 	"Můžeš mi ještę zopakovat, kde pâesnę jsi ty své vęci zakopal?";
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhereTreasures_15_00"); //Můžeš mi zopakovat, kde pâesnę jsi své vęci zakopal?
	B_Greg_RakePlaceBriefing ();
};

///////////////////////////////////////////////////////////////////////
//	Info PermTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PermTaverne		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Greg_NW_PermTaverne_Condition;
	information	 = 	DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ještę jedna vęc...";
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition ()
{
	if 	(
		(GregLocation == Greg_Bigcross)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross) == FALSE)
		&& (((Npc_GetDistToWP(self,"BIGCROSS")<1000) == FALSE)||(MIS_Addon_Greg_RakeCave == LOG_SUCCESS))
		)
	|| 	(
		(GregLocation == Greg_Dexter)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_WasWillstDu))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PermTaverne_15_00"); //Ještę jedna vęc...

	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_01"); //Napâed naval mý zakopaný vęci, teprv pak se s tebou budu bavit.
	}
	else if (MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_02"); //Jsem rád, žes mi pomoh. Ale to z nás eštę nedęlá pâátele, esli mi rozumíš.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_03"); //Už jsme toho ale nakecali dost.
	};
};


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//3. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info Bigcross
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Bigcross		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Bigcross_Condition;
	information	 = 	DIA_Addon_Greg_NW_Bigcross_Info;

	description	 = 	"Jak se vede?";
};

func int DIA_Addon_Greg_NW_Bigcross_Condition ()
{
	if (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Bigcross_Info ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)||(MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_00"); //A helemese, není to náš pan Nespolehlivej?
	};

	AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_01"); //Jak to jde?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_02"); //Tak všelijak. Ti žoldáci nejsou zrovna moc vochotný.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_03"); //Čekal jsem, že budou mít aspoŕ trochu víc kuráže.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_04"); //Jenže je to jen banda velkohubejch chlubilů, abych pravdu âek.
	
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_05"); //Tak co je s tęma vęcma, co jsem zakopal? Už jsi je našel?
		if (RAKEPLACE[1]==FALSE)
		|| (RAKEPLACE[2]==FALSE)
		|| (RAKEPLACE[3]==FALSE)
		|| (RAKEPLACE[4]==FALSE)
		|| (RAKEPLACE[5]==FALSE)
		{
			AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_06"); //Ne, všechny ještę ne.
			AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_07"); //Tak hejbni kostrou! Nejni to pâeci tak tęžký.
		};
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WhatWantFromSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhatWantFromSLD		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Info;

	description	 = 	"Co jsi męl do činęní se žoldáky?";
};

func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhatWantFromSLD_15_00"); //Co jsi męl do činęní se žoldáky?
	
	if (SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter ();
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_01"); //To už jsem ti âek. Hledám toho chlápka v červeným brnęní.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_02"); //Jenže ti troubové nemaj ani páru, která bije.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info DexterFound
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_DexterFound		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_DexterFound_Condition;
	information	 = 	DIA_Addon_Greg_NW_DexterFound_Info;

	description	 = 	"Už to mám - ty hledáš chlápka jménem Dexter.";
};

func int DIA_Addon_Greg_NW_DexterFound_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_DexterFound_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_DexterFound_15_00"); //Jestli to chápu správnę, tak hledáš jistého Dextera.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_DexterFound_01_01"); //Sakra, jak mám vędęt, jak se ten chlápek jmenuje?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Byl to jen takový nápad.", DIA_Addon_Greg_NW_DexterFound_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Nezajdeme za ním společnę?", DIA_Addon_Greg_NW_DexterFound_together );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Vím, kde ho najdeš.", DIA_Addon_Greg_NW_DexterFound_wo );
};
func void DIA_Addon_Greg_NW_DexterFound_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_weg_15_00"); //To byl jen takový nápad.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_00"); //Vím, kde ho najdeš.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_01"); //(pâekvapenę) Vážnę? TAK POVÍDEJ!
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_02"); //Nedaleko odsud.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_03"); //Vede bandu pęknę vostrejch banditů.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_04"); //(ušklíbá se) HA! Jo, to je von!
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_05"); //Já vędęl, že se ta stará suchozemská krysa tady nękde zakopala!
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_06"); //Teë už potâebuju jen prohledat všecky zdejší skrejše a myší díry.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_07"); //Já toho hajzla najdu – na to tę nepotâebuju.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_together_15_00"); //Co kdybychom za ním zašli spolu?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_together_01_01"); //Mám s ním ŕáký nevyâízený oučty. To zvládnu sám.
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//4. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_00"); //(nahlas) Kde je ta svinę?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter_15_01"); //Kdo? Kapitán? Ten je pâímo tady.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_02"); //(nahlas) Tak uhni z cesty.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"DexterHouseRun");
};

///////////////////////////////////////////////////////////////////////
//	Info WodennNu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WodennNu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WodennNu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WodennNu_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
	&& (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10")<500) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WodennNu_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_00"); //(naštvanę) Kam to šel?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WodennNu_15_01"); //Byl tady.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_02"); //(velitelsky) Tak bęž a najdi ho!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter2		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_00"); //Á, Dexter to koupil, co?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter2_15_01"); //Už to tak vypadá, že je mrtvej.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_02"); //Beztak mu to patâilo. Tak mrkni, co má u sebe.
	Npc_ExchangeRoutine	(self,"DexterHouseWalk");
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info RavensLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RavensLetter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RavensLetter_Condition;
	information	 = 	DIA_Addon_Greg_NW_RavensLetter_Info;

	description	 = 	"Dexter u sebe nemęl nic než tenhle dopis.";
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_CaughtDexter2))
	&& (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_00"); //Dexter u sebe nemęl nic než tenhle dopis.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_01"); //Ukaž mi ho.
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_02"); //A sakra, to mi vůbec nepomůže.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_03"); //Nemęli jsme ho takle vodkrouhnout.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_04"); //Ty asi nevíš, jak se dostat pâes ty hory na severovýchodę vod Khorinidu, co?
	
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_05"); //Možná nęjakým podzemním tunelem. Vodní mágové právę studují portál, který vede do hor na severovýchodę.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_06"); //(naštvanę) Co je to za ptákovinu?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_07"); //(posmęšnę) Pche. Vodní mágové. To nemůžeš pâijít s nęčím lepším?
	};
	
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_08"); //Ne.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_09"); //(rezignovanę si povzdychne) Takže tu zůstanu trčet.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_10"); //Dexter byl moje poslední nadęje.
};

///////////////////////////////////////////////////////////////////////
//	Info WasWillstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WasWillstDu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WasWillstDu_Info;

	description	 = 	"Co jsi Dexterovi chtęl?";
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_RavensLetter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WasWillstDu_15_00"); //Co jsi od Dextera chtęl?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_01"); //Pâišel jsem pâes hory na severovýchodę tohohle ostrova a teë se chci vrátit zpátky.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_02"); //Doufal jsem, že ten šmejd bude vędęt, jak se tam dostat bez lodi.

	Npc_ExchangeRoutine	(self,"DexterThrone");	

	Info_ClearChoices	(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "Co je za tęmi horami?", DIA_Addon_Greg_NW_WasWillstDu_da );
	
	if (Skip_NW.aivar[AIV_TalkedToPlayer]==TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "U pâístavu jsem vidęl piráta jménem Skip.", DIA_Addon_Greg_NW_WasWillstDu_Skip );
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_da_15_00"); //Co je za tęmi horami?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_01"); //Radši se tam ani nezkoušej dostat.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_02"); //Je to tam pęknę o držku. Takovej chcípák jako ty by tam dlouho nevydržel.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00"); //U pâístavu jsem zahlídl piráta jménem Skip.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01"); //Ten mamlas! Čekal jsem tam tâi dny. Proč pâišel tak pozdę?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02"); //Jen co se trochu zmátoâím, dám mu co proto.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundTreasure
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_FoundTreasure		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information	 = 	DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent	 = 	TRUE;

	description	 = 	"Našel jsem tvé zakopané vęci.";
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition ()
{
	if (RAKEPLACE[1]==TRUE)
	&& (RAKEPLACE[2]==TRUE)
	&& (RAKEPLACE[3]==TRUE)
	&& (RAKEPLACE[4]==TRUE)
	&& (RAKEPLACE[5]==TRUE)
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_FoundTreasure_15_00"); //Našel jsem tvé zakopané vęci.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_FoundTreasure_01_01"); //Pak bys u sebe męl mít 100 zlatejch, zlatej kalich, stâíbrnou mísu a amulet. To všecko je moje, tak to hezky naval.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
	Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "Nemám to u sebe.", DIA_Addon_Greg_NW_FoundTreasure_not );

	if ((Npc_HasItems (other,ItSe_GoldPocket100)) || (Npc_HasItems (other,itmi_gold)>= 100))
	&& (Npc_HasItems (other,ItMi_GoldCup))
	&& (Npc_HasItems (other,ItMi_SilverChalice))
	&& (Npc_HasItems (other,ItAm_Prot_Point_01))
		{
			Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "Tady máš své vęci.", DIA_Addon_Greg_NW_FoundTreasure_ja );
		};
};
func void DIA_Addon_Greg_NW_FoundTreasure_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_00"); //Tady to máš.

	if (B_GiveInvItems (other, self, ItSe_GoldPocket100,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_01"); //Váček se 100 zlaăáky.
	}	
	else if (B_GiveInvItems (other, self, ItMi_gold,100))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_02"); //100 zlaăáků.
	};

	if (B_GiveInvItems (other, self, ItMi_GoldCup,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_03"); //Zlatý kalich.
	};
	if (B_GiveInvItems (other, self, ItMi_SilverChalice,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_04"); //Stâíbrná mísa.
	};
	if (B_GiveInvItems (other, self, ItAm_Prot_Point_01,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_05"); //A amulet.
	};
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_06"); //Výbornę. Máš kliku, žes nebyl tak blbej a nezdrhnul jsi s tím.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_07"); //Tady máš podíl z lupu.

	B_GiveInvItems (self, other, ItMi_gold,30);
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
		
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_not_15_00"); //To u sebe nemám.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_not_01_01"); //Tak mi koukej ty vęci pâinýst, než se z toho zcvoknu.
	AI_StopProcessInfos (self);
};

