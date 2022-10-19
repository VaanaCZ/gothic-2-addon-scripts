// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Co ciê sprowadza do tego miejsca?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //S³ugo ciemnoœci! Co ciê sprowadza do tego miejsca? Czy twoim jedynym celem jest sianie strachu i zniszczenia?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Prawdziwy cel naszego przybycia do tego œwiata nigdy nie zostanie ci wyjawiony, cz³owiecze.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Jak mam zmusiæ do mówienia pozosta³e smoki?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Co muszê zrobiæ, aby ponownie ciê wygnaæ?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Na Innosa, co mam uczyniæ, by przegnaæ was precz z królestwa ludzi?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //By tego dokonaæ, musia³byœ najpierw zrozumieæ znaczenie naszego spotkania.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Ale ¿aden z nas nie wyjawi ci go z w³asnej woli.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Tylko Oko mog³oby rozwi¹zaæ nasze jêzyki i wyjawiæ ci nasz prawdziwy cel.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //W ka¿dym razie, po swojej œmierci niewiele bêdziesz mia³ z tej wiedzy po¿ytku.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Doniesiono nam, ¿e obra³eœ drogê ³owcy smoków.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Dlatego wys³aliœmy do twojego œwiata nasz pomiot, by zapewniæ przetrwanie naszej staro¿ytnej dynastii.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Przegra³eœ tê wojnê, ma³y cz³owieczku.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Jeden z tych smoków mamrota³ coœ o 'potomkach' i utrzymaniu ci¹g³oœci jego rodu. Bojê siê, ¿e te potwory rozpleni³y siê po ca³ym cywilizowanym œwiecie."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //Oko pozwala ci rzuciæ mi wyzwanie, ale to w walce oka¿e siê, czy jesteœ mnie godzien.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Jak mam zmusiæ do mówienia pozosta³e smoki?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Tylko moje serce pozwoli ci odnowiæ moc Oka.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Ale nigdy nie zdo³asz wyrwaæ go z mojej piersi.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "Kto was tu przys³a³?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Kto wam rozkazuje? Kto was tu przys³a³?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Naszymi czynami kieruje nasz Pan i jego S³owo Mocy. Wkrótce nikt nie zdo³a oprzeæ siê jego woli.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Jego ramiê siêga daleko poza Królestwo Umar³ych. Duchy nocy gromadz¹ siê wokó³, oczekuj¹c jego nadejœcia.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Wkrótce zostaniecie pokonani, a on zapanuje nad œwiatem.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //W porównaniu z nim, nawet my jesteœmy nic nie znacz¹cym py³em.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Nasz Pan nadejdzie, by wskrzesiæ wasze cia³a z popio³ów i wykorzystaæ je do podporz¹dkowania sobie tego œwiata.

	B_LogEntry (TOPIC_DRACHENJAGD,"Te smoki nie s¹ samodzielnymi istotami. S³u¿¹ jakiemuœ panu, o którym nie chc¹ mówiæ - no, mo¿e poza bezwartoœciowymi przepowiedniami w stylu 'nasz pan przyjdzie i zniszczy œwiat, bla bla bla'. Nic nowego."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "Jak mogê pokonaæ twego pana?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Jak mogê pokonaæ twego pana?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Mój Pan jest wszechpotê¿ny i niemal niezwyciê¿ony. Gdybyœ okaza³ siê wystarczaj¹co g³upi, by stawiæ mu czo³a, czeka ciê d³uga, powolna œmieræ w okrutnych mêczarniach.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //Nie pierwszy raz s³yszê coœ takiego. NIEMAL niezwyciê¿ony, a wiêc mo¿na go pokonaæ!
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Mów wiêc! Co muszê uczyniæ?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Aby stawiæ mu czo³a, musisz posiadaæ rzeczy, których on nigdy nie pozwoli ci zdobyæ.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //Co dok³adnie?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Musisz posi¹œæ najwspanialsz¹ zbrojê, jak¹ widzia³ ten œwiat, i za³o¿yæ j¹ do ostatniego starcia.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Potrzebujesz miecza pob³ogos³awionego przez twojego boga.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Potrzebujesz runy, która powsta³a specjalnie dla ciebie.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Potrzebujesz orê¿a, który wykonano specjalnie dla ciebie.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Ale najtrudniejszym do spe³nienia warunkiem jest znalezienie piêciu towarzyszy gotowych pójœæ za tob¹ na pewn¹ œmieræ.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Dopiero wtedy mo¿esz stawiæ czo³a mojemu Panu.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "Gdzie znajdê twego pana?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Gdzie znajdê twego pana?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Jego skarbiec znajduje siê w kamiennym Dworze Irdorath. Tam go szukaj.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Póki nie uda mu siê przywróciæ w³aœciwego porz¹dku œwiata, bêdzie tam spoczywa³, pogr¹¿ony w zadumie...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Daruj sobie szczegó³y. Powiedz mi lepiej, gdzie siê znajduje ten Dwór Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha, ha, ha. Rozczarowa³eœ mnie, cz³owieczku. Przezwyciê¿y³eœ tyle przeciwnoœci i pokona³eœ niemal wszystkich z nas, a teraz oœmieszasz siê w³asn¹ niewiedz¹.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Jeœli nazwa Irdorath nic ci nie mówi, lepiej udaj siê do swoich magów i poproœ, by pozwolili ci sobie us³ugiwaæ.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Bo najwyraŸniej nie jesteœ jeszcze gotów, by dŸwigaæ brzemiê prawdziwej wiedzy.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"W³adca smoków skry³ siê podobno w potê¿nym i œwiêtym Dworze Irdorath. To brzmi jakoœ znajomo. Gdzie to ja mog³em o tym czytaæ?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













